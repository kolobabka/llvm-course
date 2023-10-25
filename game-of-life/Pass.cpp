#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
using namespace llvm;

namespace {
struct MyPass : public FunctionPass {
  static char ID;
  MyPass() : FunctionPass(ID) {}

  bool isFuncLogger(StringRef name) {
    return name == "logInstr" || name == "dropStat";
  }

  virtual bool runOnFunction(Function &F) {
    if (isFuncLogger(F.getName())) {
      return false;
    }

    // Prepare builder for IR modification
    LLVMContext &Ctx = F.getContext();
    IRBuilder<> builder(Ctx);
    Type *voidType = Type::getVoidTy(Ctx);

    ArrayRef<Type *> LoggerParamTypes = {builder.getInt8Ty()->getPointerTo()};
    FunctionType *LoggerFuncType = FunctionType::get(voidType, LoggerParamTypes, false);
    FunctionCallee LoggerFunc = F.getParent()->getOrInsertFunction("logInstr", LoggerFuncType);

    ArrayRef<Type *> DropStatParamTypes = {};
    FunctionType *DropStatFuncType = FunctionType::get(voidType, DropStatParamTypes, false);
    FunctionCallee DropStatFunc = F.getParent()->getOrInsertFunction("dropStat", DropStatFuncType);

    for (auto &B : F) {
      for (auto &I : B) {
        Value *valueAddr =
            ConstantInt::get(builder.getInt64Ty(), (int64_t)(&I));
        if (auto *call = dyn_cast<CallInst>(&I)) {
          Function *callee = call->getCalledFunction();
          if (callee && isFuncLogger(callee->getName()))
            continue;
        }
        builder.SetInsertPoint(&I);
        
        if (F.getName() == "main" && dyn_cast<ReturnInst>(&I)) {
          builder.CreateCall(DropStatFunc);
          continue;
        }

        SmallVector<char> Buf;
        raw_svector_ostream OBuf(Buf);
        I.print(OBuf, true);
        
        std::string Str(Buf.begin(), Buf.end());

        Value *InstrLog = builder.CreateGlobalStringPtr(Str.data());
        Value *Arg[] = {InstrLog};
        builder.CreateCall(LoggerFunc, Arg);
      }
    }
    return true;
  }
};
} // namespace

char MyPass::ID = 0;

// Automatically enable the pass.
// http://adriansampson.net/blog/clangpass.html
static void registerMyPass(const PassManagerBuilder &,
                                 legacy::PassManagerBase &PM) {
  PM.add(new MyPass());
}
static RegisterStandardPasses
    RegisterMyPass(PassManagerBuilder::EP_EarlyAsPossible,
                   registerMyPass);
