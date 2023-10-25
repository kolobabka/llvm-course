# How to build

```
clang++ ./Pass.cpp -c -fPIC -I`llvm-config --includedir` -o Pass.o
clang++ Pass.o -fPIC -shared -o libPass.so
clang++ log.cpp -fPIC -c -o log.o
clang-14 -Xclang -load -Xclang ./libPass.so main.c engine/engine.c log.o -lstdc++ -flegacy-pass-manager -o GameOfLife
```

you would get an executable 'GameOfLife' file

# Statistic 
```

  br label %85 --- 1
  %10 = call i32 @newTurn(i8* noundef %9) --- 1
  br label %40 --- 1
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #5 --- 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %90, i8* align 16 %91, i64 640000, i1 false) --- 1
  ret void --- 1
  %8 = getelementptr inbounds [640000 x i8], [640000 x i8]* %6, i64 0, i64 0 --- 1
  %8 = alloca i32, align 4 --- 1
  br label %9 --- 1
  %5 = alloca [640000 x i8], align 16 --- 1
  call void @srand(i32 noundef %7) #5 --- 1
  %94 = bitcast i32* %4 to i8* --- 1
  store i32 1, i32* %2, align 4 --- 1
  call void @llvm.lifetime.end.p0i8(i64 640000, i8* %11) #3 --- 1
  call void @llvm.lifetime.start.p0i8(i64 640000, i8* %12) #5 --- 1
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #5 --- 1
  %3 = alloca i8*, align 8 --- 1
  %8 = bitcast i32* %3 to i8* --- 1
  %9 = getelementptr inbounds [640000 x i8], [640000 x i8]* %6, i64 0, i64 0 --- 1
  br i1 %87, label %88, label %89 --- 1
  store i8** %1, i8*** %5, align 8, !tbaa !9 --- 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %13, i8* align 1 %14, i64 640000, i1 false) --- 1
  %12 = bitcast [640000 x i8]* %5 to i8* --- 1
  store i32 1, i32* %7, align 4 --- 1
  %86 = load i32, i32* %4, align 4, !tbaa !9 --- 1
  %90 = load i8*, i8** %3, align 8, !tbaa !5 --- 1
  store i8* %0, i8** %2, align 8, !tbaa !5 --- 1
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #5 --- 1
  %10 = alloca i32, align 4 --- 1
  %9 = alloca i32, align 4 --- 1
  %20 = bitcast i32* %6 to i8* --- 1
  store i32 0, i32* %4, align 4, !tbaa !9 --- 1
  store i32 0, i32* %6, align 4, !tbaa !9 --- 1
  %11 = bitcast i32* %4 to i8* --- 1
  store i32 2, i32* %7, align 4 --- 1
  store i8* %0, i8** %3, align 8, !tbaa !5 --- 1
  %13 = getelementptr inbounds [640000 x i8], [640000 x i8]* %5, i64 0, i64 0 --- 1
  call void @initGameSpace(i8* noundef %8) --- 1
  %13 = bitcast i32* %3 to i8* --- 1
  %11 = bitcast [640000 x i8]* %6 to i8* --- 1
  %2 = alloca i8*, align 8 --- 1
  %15 = bitcast i32* %6 to i8* --- 1
  %7 = bitcast [640000 x i8]* %6 to i8* --- 1
  store i32 0, i32* %3, align 4 --- 1
  %91 = getelementptr inbounds [640000 x i8], [640000 x i8]* %5, i64 0, i64 0 --- 1
  %87 = icmp eq i32 %86, 640000 --- 1
  br label %92 --- 1
  %93 = bitcast [640000 x i8]* %5 to i8* --- 1
  call void @llvm.lifetime.end.p0i8(i64 640000, i8* %93) #5 --- 1
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %94) #5 --- 1
  %95 = load i32, i32* %2, align 4 --- 1
  ret i32 %95 --- 1
  %5 = alloca i8**, align 8 --- 1
  store i32 %0, i32* %4, align 4, !tbaa !5 --- 1
  %6 = alloca [640000 x i8], align 16 --- 1
  %6 = call i64 @time(i64* noundef null) #5 --- 1
  store i32 0, i32* %3, align 4, !tbaa !9 --- 1
  %14 = load i8*, i8** %3, align 8, !tbaa !5 --- 1
  store i32 2, i32* %4, align 4 --- 1
  call void @llvm.lifetime.start.p0i8(i64 640000, i8* %7) #3 --- 1
  %7 = trunc i64 %6 to i32 --- 1
  %3 = alloca i32, align 4 --- 2
  %4 = alloca i32, align 4 --- 3
  br label %37 --- 800
  store i32 5, i32* %7, align 4 --- 800
  store i32 0, i32* %5, align 4, !tbaa !9 --- 800
  store i32 %84, i32* %6, align 4, !tbaa !9 --- 800
  %83 = load i32, i32* %6, align 4, !tbaa !9 --- 800
  br label %23 --- 800
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %22) #5 --- 800
  store i32 0, i32* %8, align 4, !tbaa !9 --- 800
  br label %36 --- 800
  store i32 5, i32* %4, align 4 --- 800
  br label %9, !llvm.loop !15 --- 800
  store i32 %39, i32* %3, align 4, !tbaa !9 --- 800
  br label %81 --- 800
  %38 = load i32, i32* %3, align 4, !tbaa !9 --- 800
  %20 = bitcast i32* %5 to i8* --- 800
  %39 = add nsw i32 %38, 1 --- 800
  %15 = bitcast i32* %5 to i8* --- 800
  %22 = bitcast i32* %8 to i8* --- 800
  br label %82 --- 800
  %27 = bitcast i32* %8 to i8* --- 800
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %27) #5 --- 800
  br label %16, !llvm.loop !16 --- 800
  %84 = add nsw i32 %83, 1 --- 800
  br i1 %11, label %14, label %12 --- 801
  %17 = load i32, i32* %6, align 4, !tbaa !9 --- 801
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %15) #5 --- 801
  %11 = icmp slt i32 %10, 800 --- 801
  %10 = load i32, i32* %3, align 4, !tbaa !9 --- 801
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #5 --- 801
  br label %16 --- 801
  store i8 1, i8* %70, align 1, !tbaa !11 --- 69804
  %68 = load i32, i32* %10, align 4, !tbaa !9 --- 69804
  %70 = getelementptr inbounds [640000 x i8], [640000 x i8]* %5, i64 0, i64 %69 --- 69804
  %69 = zext i32 %68 to i64 --- 69804
  %53 = load i32, i32* %10, align 4, !tbaa !9 --- 215027
  store i8 0, i8* %55, align 1, !tbaa !11 --- 215027
  %55 = getelementptr inbounds [640000 x i8], [640000 x i8]* %5, i64 0, i64 %54 --- 215027
  %54 = zext i32 %53 to i64 --- 215027
  %50 = load i32, i32* %9, align 4, !tbaa !9 --- 308876
  %51 = icmp ugt i32 %50, 3 --- 308876
  br i1 %51, label %52, label %56 --- 308876
  %65 = load i32, i32* %9, align 4, !tbaa !9 --- 319723
  br i1 %66, label %67, label %71 --- 319723
  %66 = icmp eq i32 %65, 3 --- 319723
  %48 = icmp ult i32 %47, 2 --- 320277
  br i1 %48, label %52, label %49 --- 320277
  %47 = load i32, i32* %9, align 4, !tbaa !9 --- 320277
  %72 = load i32, i32* %4, align 4, !tbaa !9 --- 355169
  store i32 %73, i32* %4, align 4, !tbaa !9 --- 355169
  %73 = add nsw i32 %72, 1 --- 355169
  %58 = zext i32 %57 to i64 --- 424973
  br i1 %63, label %64, label %71 --- 424973
  %62 = zext i1 %61 to i32 --- 424973
  %61 = trunc i8 %60 to i1 --- 424973
  %59 = getelementptr inbounds [640000 x i8], [640000 x i8]* %5, i64 0, i64 %58 --- 424973
  br label %74 --- 424973
  %60 = load i8, i8* %59, align 1, !tbaa !11, !range !13 --- 424973
  %63 = icmp eq i32 %62, 0 --- 424973
  %57 = load i32, i32* %10, align 4, !tbaa !9 --- 424973
  %56 = load i32, i32* %7, align 4, !tbaa !9 --- 638401
  store i32 %57, i32* %7, align 4, !tbaa !9 --- 638401
  %57 = add i32 %56, %55 --- 638401
  %64 = sub nsw i32 %63, 1 --- 638401
  %124 = load i8, i8* %123, align 1, !tbaa !11, !range !13 --- 638401
  %125 = trunc i8 %124 to i1 --- 638401
  %68 = sub nsw i32 %67, 1 --- 638401
  %99 = add nsw i32 %98, 1 --- 638401
  %100 = mul nsw i32 %99, 800 --- 638401
  store i32 %75, i32* %7, align 4, !tbaa !9 --- 638401
  br label %111 --- 638401
  %44 = load i8*, i8** %4, align 8, !tbaa !5 --- 638401
  %49 = add nsw i32 %47, %48 --- 638401
  %127 = load i32, i32* %7, align 4, !tbaa !9 --- 638401
  %48 = load i32, i32* %6, align 4, !tbaa !9 --- 638401
  %55 = zext i1 %54 to i32 --- 638401
  %51 = sext i32 %50 to i64 --- 638401
  %52 = getelementptr inbounds i8, i8* %44, i64 %51 --- 638401
  %47 = mul nsw i32 %46, 800 --- 638401
  %116 = load i32, i32* %5, align 4, !tbaa !9 --- 638401
  %53 = load i8, i8* %52, align 1, !tbaa !11, !range !13 --- 638401
  %101 = load i32, i32* %6, align 4, !tbaa !9 --- 638401
  %102 = add nsw i32 %100, %101 --- 638401
  store i32 %110, i32* %7, align 4, !tbaa !9 --- 638401
  %106 = load i8, i8* %105, align 1, !tbaa !11, !range !13 --- 638401
  %110 = add i32 %109, %108 --- 638401
  %109 = load i32, i32* %7, align 4, !tbaa !9 --- 638401
  %54 = trunc i8 %53 to i1 --- 638401
  %108 = zext i1 %107 to i32 --- 638401
  %107 = trunc i8 %106 to i1 --- 638401
  %105 = getelementptr inbounds i8, i8* %97, i64 %104 --- 638401
  %104 = sext i32 %103 to i64 --- 638401
  %103 = add nsw i32 %102, 1 --- 638401
  %66 = load i32, i32* %6, align 4, !tbaa !9 --- 638401
  %65 = mul nsw i32 %64, 800 --- 638401
  %115 = load i8*, i8** %4, align 8, !tbaa !5 --- 638401
  %45 = load i32, i32* %5, align 4, !tbaa !9 --- 638401
  %63 = load i32, i32* %5, align 4, !tbaa !9 --- 638401
  %117 = sub nsw i32 %116, 1 --- 638401
  %62 = load i8*, i8** %4, align 8, !tbaa !5 --- 638401
  br label %58 --- 638401
  %118 = mul nsw i32 %117, 800 --- 638401
  %120 = add nsw i32 %118, %119 --- 638401
  %50 = sub nsw i32 %49, 1 --- 638401
  %121 = add nsw i32 %120, 1 --- 638401
  %123 = getelementptr inbounds i8, i8* %115, i64 %122 --- 638401
  %98 = load i32, i32* %5, align 4, !tbaa !9 --- 638401
  %128 = add i32 %127, %126 --- 638401
  br label %129 --- 638401
  %126 = zext i1 %125 to i32 --- 638401
  %97 = load i8*, i8** %4, align 8, !tbaa !5 --- 638401
  %122 = sext i32 %121 to i64 --- 638401
  %75 = add i32 %74, %73 --- 638401
  %70 = getelementptr inbounds i8, i8* %62, i64 %69 --- 638401
  %72 = trunc i8 %71 to i1 --- 638401
  %73 = zext i1 %72 to i32 --- 638401
  %74 = load i32, i32* %7, align 4, !tbaa !9 --- 638401
  br label %76 --- 638401
  %71 = load i8, i8* %70, align 1, !tbaa !11, !range !13 --- 638401
  %46 = add nsw i32 %45, 1 --- 638401
  %119 = load i32, i32* %6, align 4, !tbaa !9 --- 638401
  %69 = sext i32 %68 to i64 --- 638401
  store i32 %128, i32* %7, align 4, !tbaa !9 --- 638401
  %67 = add nsw i32 %65, %66 --- 638401
  %154 = mul nsw i32 %153, 800 --- 639200
  %152 = load i32, i32* %5, align 4, !tbaa !9 --- 639200
  %81 = load i8*, i8** %4, align 8, !tbaa !5 --- 639200
  %153 = sub nsw i32 %152, 1 --- 639200
  %156 = add nsw i32 %154, %155 --- 639200
  %38 = zext i1 %37 to i32 --- 639200
  %157 = sext i32 %156 to i64 --- 639200
  %158 = getelementptr inbounds i8, i8* %151, i64 %157 --- 639200
  %160 = trunc i8 %159 to i1 --- 639200
  %88 = getelementptr inbounds i8, i8* %81, i64 %87 --- 639200
  %89 = load i8, i8* %88, align 1, !tbaa !11, !range !13 --- 639200
  %163 = add i32 %162, %161 --- 639200
  %112 = load i8, i8* %11, align 1, !tbaa !11, !range !13 --- 639200
  store i32 %163, i32* %7, align 4, !tbaa !9 --- 639200
  br i1 %95, label %96, label %111 --- 639200
  %155 = load i32, i32* %6, align 4, !tbaa !9 --- 639200
  %84 = load i32, i32* %6, align 4, !tbaa !9 --- 639200
  %90 = trunc i8 %89 to i1 --- 639200
  %93 = add i32 %92, %91 --- 639200
  %92 = load i32, i32* %7, align 4, !tbaa !9 --- 639200
  %94 = load i8, i8* %10, align 1, !tbaa !11, !range !13 --- 639200
  %87 = sext i32 %86 to i64 --- 639200
  %113 = trunc i8 %112 to i1 --- 639200
  %91 = zext i1 %90 to i32 --- 639200
  %86 = add nsw i32 %85, 1 --- 639200
  %37 = trunc i8 %36 to i1 --- 639200
  %162 = load i32, i32* %7, align 4, !tbaa !9 --- 639200
  %29 = load i32, i32* %5, align 4, !tbaa !9 --- 639200
  %85 = add nsw i32 %83, %84 --- 639200
  %32 = add nsw i32 %30, %31 --- 639200
  %34 = sext i32 %33 to i64 --- 639200
  %159 = load i8, i8* %158, align 1, !tbaa !11, !range !13 --- 639200
  %36 = load i8, i8* %35, align 1, !tbaa !11, !range !13 --- 639200
  %82 = load i32, i32* %5, align 4, !tbaa !9 --- 639200
  %39 = load i32, i32* %7, align 4, !tbaa !9 --- 639200
  %134 = load i8*, i8** %4, align 8, !tbaa !5 --- 639200
  %142 = load i8, i8* %141, align 1, !tbaa !11, !range !13 --- 639200
  br label %77 --- 639200
  %40 = add i32 %39, %38 --- 639200
  %139 = add nsw i32 %137, %138 --- 639200
  %35 = getelementptr inbounds i8, i8* %28, i64 %34 --- 639200
  br i1 %60, label %61, label %76 --- 639200
  %60 = trunc i8 %59 to i1 --- 639200
  %59 = load i8, i8* %11, align 1, !tbaa !11, !range !13 --- 639200
  %42 = trunc i8 %41 to i1 --- 639200
  %41 = load i8, i8* %10, align 1, !tbaa !11, !range !13 --- 639200
  store i32 %40, i32* %7, align 4, !tbaa !9 --- 639200
  store i32 %146, i32* %7, align 4, !tbaa !9 --- 639200
  br label %130 --- 639200
  store i32 %93, i32* %7, align 4, !tbaa !9 --- 639200
  %151 = load i8*, i8** %4, align 8, !tbaa !5 --- 639200
  %83 = mul nsw i32 %82, 800 --- 639200
  br label %164 --- 639200
  br i1 %113, label %114, label %129 --- 639200
  %28 = load i8*, i8** %4, align 8, !tbaa !5 --- 639200
  %30 = mul nsw i32 %29, 800 --- 639200
  br i1 %42, label %43, label %58 --- 639200
  %33 = sub nsw i32 %32, 1 --- 639200
  %95 = trunc i8 %94 to i1 --- 639200
  %135 = load i32, i32* %5, align 4, !tbaa !9 --- 639200
  %141 = getelementptr inbounds i8, i8* %134, i64 %140 --- 639200
  %144 = zext i1 %143 to i32 --- 639200
  %140 = sext i32 %139 to i64 --- 639200
  %161 = zext i1 %160 to i32 --- 639200
  %136 = add nsw i32 %135, 1 --- 639200
  %146 = add i32 %145, %144 --- 639200
  %143 = trunc i8 %142 to i1 --- 639200
  %137 = mul nsw i32 %136, 800 --- 639200
  %145 = load i32, i32* %7, align 4, !tbaa !9 --- 639200
  br label %147 --- 639200
  %138 = load i32, i32* %6, align 4, !tbaa !9 --- 639200
  %39 = load i32, i32* %10, align 4, !tbaa !9 --- 640000
  %78 = load i8, i8* %9, align 1, !tbaa !11, !range !13 --- 640000
  %32 = load i32, i32* %8, align 4, !tbaa !9 --- 640000
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %8) #5 --- 640000
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %29) #5 --- 640000
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %9) #5 --- 640000
  %13 = load i32, i32* %6, align 4, !tbaa !9 --- 640000
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %11) #5 --- 640000
  %12 = bitcast i32* %7 to i8* --- 640000
  br label %23, !llvm.loop !14 --- 640000
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %8) #5 --- 640000
  store i32 %2, i32* %6, align 4, !tbaa !9 --- 640000
  store i32 %1, i32* %5, align 4, !tbaa !9 --- 640000
  %131 = load i8, i8* %10, align 1, !tbaa !11, !range !13 --- 640000
  %20 = call zeroext i1 @hasUpperNeighbour(i32 noundef %19) --- 640000
  %33 = call i32 @countNeighbours(i8* noundef %30, i32 noundef %31, i32 noundef %32) --- 640000
  %37 = load i32, i32* %8, align 4, !tbaa !9 --- 640000
  %16 = load i32, i32* %6, align 4, !tbaa !9 --- 640000
  %11 = alloca i8, align 1 --- 640000
  %79 = load i32, i32* %8, align 4, !tbaa !9 --- 640000
  %80 = add nsw i32 %79, 1 --- 640000
  store i8* %0, i8** %4, align 8, !tbaa !5 --- 640000
  %79 = trunc i8 %78 to i1 --- 640000
  %76 = bitcast i32* %10 to i8* --- 640000
  %41 = getelementptr inbounds [640000 x i8], [640000 x i8]* %5, i64 0, i64 %40 --- 640000
  store i32 0, i32* %7, align 4, !tbaa !9 --- 640000
  %34 = load i32, i32* %5, align 4, !tbaa !9 --- 640000
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %76) #5 --- 640000
  %77 = bitcast i32* %9 to i8* --- 640000
  br label %78 --- 640000
  %29 = add nsw i32 %27, %28 --- 640000
  %43 = trunc i8 %42 to i1 --- 640000
  store i8 %18, i8* %9, align 1, !tbaa !11 --- 640000
  %17 = call zeroext i1 @hasRightNeighbour(i32 noundef %16) --- 640000
  %44 = zext i1 %43 to i32 --- 640000
  %38 = add nsw i32 %36, %37 --- 640000
  %34 = bitcast i32* %10 to i8* --- 640000
  store i32 %33, i32* %9, align 4, !tbaa !9 --- 640000
  ret i32 %165 --- 640000
  %166 = bitcast i32* %7 to i8* --- 640000
  store i8 %15, i8* %8, align 1, !tbaa !11 --- 640000
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %9) #5 --- 640000
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %10) #5 --- 640000
  store i8 %21, i8* %10, align 1, !tbaa !11 --- 640000
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %10) #5 --- 640000
  br label %75 --- 640000
  %165 = load i32, i32* %7, align 4, !tbaa !9 --- 640000
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %77) #5 --- 640000
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %166) #5 --- 640000
  %23 = srem i32 %22, 2 --- 640000
  %148 = load i8, i8* %11, align 1, !tbaa !11, !range !13 --- 640000
  %21 = zext i1 %20 to i8 --- 640000
  %36 = mul nsw i32 %35, 800 --- 640000
  %23 = call zeroext i1 @hasDownNeighbour(i32 noundef %22) --- 640000
  %18 = zext i1 %17 to i8 --- 640000
  br i1 %132, label %133, label %147 --- 640000
  store i8 %24, i8* %11, align 1, !tbaa !11 --- 640000
  %22 = call i32 @rand() #5 --- 640000
  %22 = load i32, i32* %5, align 4, !tbaa !9 --- 640000
  %26 = trunc i8 %25 to i1 --- 640000
  %25 = load i8, i8* %8, align 1, !tbaa !11, !range !13 --- 640000
  %30 = sext i32 %29 to i64 --- 640000
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #5 --- 640000
  %29 = bitcast i32* %9 to i8* --- 640000
  %27 = mul nsw i32 %26, 800 --- 640000
  store i32 %80, i32* %8, align 4, !tbaa !9 --- 640000
  %15 = zext i1 %14 to i8 --- 640000
  %35 = add nsw i32 %34, 1 --- 640000
  %28 = load i32, i32* %5, align 4, !tbaa !9 --- 640000
  br label %33 --- 640000
  %24 = zext i1 %23 to i8 --- 640000
  %31 = getelementptr inbounds i8, i8* %25, i64 %30 --- 640000
  %25 = load i8*, i8** %2, align 8, !tbaa !5 --- 640000
  store i8 %32, i8* %31, align 1, !tbaa !11 --- 640000
  store i32 %35, i32* %5, align 4, !tbaa !9 --- 640000
  %26 = load i32, i32* %3, align 4, !tbaa !9 --- 640000
  %9 = alloca i8, align 1 --- 640000
  br i1 %149, label %150, label %164 --- 640000
  %132 = trunc i8 %131 to i1 --- 640000
  %35 = load i32, i32* %6, align 4, !tbaa !9 --- 640000
  %42 = load i8, i8* %41, align 1, !tbaa !11, !range !13 --- 640000
  %4 = alloca i8*, align 8 --- 640000
  %30 = load i8*, i8** %3, align 8, !tbaa !5 --- 640000
  br label %16, !llvm.loop !13 --- 640000
  %10 = alloca i8, align 1 --- 640000
  %45 = icmp eq i32 %44, 1 --- 640000
  %24 = icmp ne i32 %23, 0 --- 640000
  br i1 %45, label %46, label %56 --- 640000
  store i32 %38, i32* %10, align 4, !tbaa !9 --- 640000
  %14 = call zeroext i1 @hasLeftNeighbour(i32 noundef %13) --- 640000
  %8 = alloca i8, align 1 --- 640000
  %19 = load i32, i32* %5, align 4, !tbaa !9 --- 640000
  %149 = trunc i8 %148 to i1 --- 640000
  br i1 %26, label %27, label %77 --- 640000
  %32 = zext i1 %24 to i8 --- 640000
  br i1 %79, label %80, label %130 --- 640000
  %40 = zext i32 %39 to i64 --- 640000
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %34) #5 --- 640000
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %11) #5 --- 640000
  %6 = alloca i32, align 4 --- 640001
  %7 = alloca i32, align 4 --- 640001
  %5 = alloca i32, align 4 --- 640001
  %24 = load i32, i32* %8, align 4, !tbaa !9 --- 640800
  %17 = load i32, i32* %5, align 4, !tbaa !9 --- 640800
  br i1 %25, label %28, label %26 --- 640800
  %25 = icmp slt i32 %24, 800 --- 640800
  %18 = icmp slt i32 %17, 800 --- 641601
  br i1 %18, label %21, label %19 --- 641601
  %31 = load i32, i32* %6, align 4, !tbaa !9 --- 1279200
  %4 = icmp ne i32 %3, 0 --- 1280000
  %4 = icmp ne i32 %3, 799 --- 1280000
  %3 = load i32, i32* %2, align 4, !tbaa !5 --- 2560000
  ret i1 %4 --- 2560000
  store i32 %0, i32* %2, align 4, !tbaa !5 --- 2560000
  %2 = alloca i32, align 4 --- 2560001

```