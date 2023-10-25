; ModuleID = 'engine.c'
source_filename = "engine.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local void @initGameSpace(i8* nocapture noundef writeonly %0) local_unnamed_addr #0 {
  %2 = tail call i64 @time(i64* noundef null) #5
  %3 = trunc i64 %2 to i32
  tail call void @srand(i32 noundef %3) #5
  br label %4

4:                                                ; preds = %1, %8
  %5 = phi i64 [ 0, %1 ], [ %9, %8 ]
  %6 = mul nuw nsw i64 %5, 800
  br label %11

7:                                                ; preds = %8
  ret void

8:                                                ; preds = %11
  %9 = add nuw nsw i64 %5, 1
  %10 = icmp eq i64 %9, 800
  br i1 %10, label %7, label %4, !llvm.loop !5

11:                                               ; preds = %4, %11
  %12 = phi i64 [ 0, %4 ], [ %18, %11 ]
  %13 = tail call i32 @rand() #5
  %14 = add nuw nsw i64 %12, %6
  %15 = getelementptr inbounds i8, i8* %0, i64 %14
  %16 = trunc i32 %13 to i8
  %17 = and i8 %16, 1
  store i8 %17, i8* %15, align 1, !tbaa !7
  %18 = add nuw nsw i64 %12, 1
  %19 = icmp eq i64 %18, 800
  br i1 %19, label %8, label %11, !llvm.loop !11
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @time(i64* noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nofree nosync nounwind uwtable
define dso_local i32 @newTurn(i8* nocapture noundef %0) local_unnamed_addr #3 {
  %2 = alloca [640000 x i8], align 16
  %3 = getelementptr inbounds [640000 x i8], [640000 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 640000, i8* nonnull %3) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(640000) %3, i8* noundef nonnull align 1 dereferenceable(640000) %0, i64 640000, i1 false)
  br label %4

4:                                                ; preds = %1, %62
  %5 = phi i64 [ 0, %1 ], [ %63, %62 ]
  %6 = phi i32 [ 0, %1 ], [ %143, %62 ]
  %7 = icmp eq i64 %5, 0
  %8 = icmp eq i64 %5, 799
  %9 = mul nuw nsw i64 %5, 800
  %10 = add nuw nsw i64 %9, 800
  %11 = add nsw i64 %9, -800
  %12 = or i64 %9, 1
  %13 = getelementptr inbounds i8, i8* %0, i64 %12
  %14 = load i8, i8* %13, align 1, !tbaa !7, !range !12
  br i1 %7, label %20, label %15

15:                                               ; preds = %4
  %16 = add nuw nsw i64 %9, 801
  %17 = getelementptr inbounds i8, i8* %0, i64 %16
  %18 = load i8, i8* %17, align 1, !tbaa !7, !range !12
  %19 = add nuw nsw i8 %14, %18
  br label %20

20:                                               ; preds = %15, %4
  %21 = phi i8 [ %19, %15 ], [ %14, %4 ]
  %22 = zext i8 %21 to i32
  br i1 %8, label %29, label %23

23:                                               ; preds = %20
  %24 = add nsw i64 %9, -799
  %25 = getelementptr inbounds i8, i8* %0, i64 %24
  %26 = load i8, i8* %25, align 1, !tbaa !7, !range !12
  %27 = zext i8 %26 to i32
  %28 = add nuw nsw i32 %22, %27
  br label %29

29:                                               ; preds = %23, %20
  %30 = phi i32 [ %28, %23 ], [ %22, %20 ]
  br i1 %7, label %36, label %31

31:                                               ; preds = %29
  %32 = getelementptr inbounds i8, i8* %0, i64 %10
  %33 = load i8, i8* %32, align 1, !tbaa !7, !range !12
  %34 = zext i8 %33 to i32
  %35 = add nuw nsw i32 %30, %34
  br label %36

36:                                               ; preds = %31, %29
  %37 = phi i32 [ %35, %31 ], [ %30, %29 ]
  br i1 %8, label %43, label %38

38:                                               ; preds = %36
  %39 = getelementptr inbounds i8, i8* %0, i64 %11
  %40 = load i8, i8* %39, align 1, !tbaa !7, !range !12
  %41 = zext i8 %40 to i32
  %42 = add nuw nsw i32 %37, %41
  br label %43

43:                                               ; preds = %38, %36
  %44 = phi i32 [ %42, %38 ], [ %37, %36 ]
  %45 = getelementptr inbounds [640000 x i8], [640000 x i8]* %2, i64 0, i64 %9
  %46 = load i8, i8* %45, align 16, !tbaa !7, !range !12
  %47 = icmp eq i8 %46, 0
  %48 = and i32 %44, -2
  %49 = icmp eq i32 %48, 2
  %50 = select i1 %47, i1 true, i1 %49
  br i1 %50, label %52, label %51

51:                                               ; preds = %43
  store i8 0, i8* %45, align 16, !tbaa !7
  br label %58

52:                                               ; preds = %43
  %53 = icmp eq i32 %44, 3
  %54 = select i1 %47, i1 %53, i1 false
  br i1 %54, label %57, label %55

55:                                               ; preds = %52
  %56 = add nsw i32 %6, 1
  br label %58

57:                                               ; preds = %52
  store i8 1, i8* %45, align 16, !tbaa !7
  br label %58

58:                                               ; preds = %51, %55, %57
  %59 = phi i32 [ %6, %57 ], [ %56, %55 ], [ %6, %51 ]
  br label %65

60:                                               ; preds = %62
  %61 = icmp eq i32 %143, 640000
  br i1 %61, label %147, label %146

62:                                               ; preds = %142
  %63 = add nuw nsw i64 %5, 1
  %64 = icmp eq i64 %63, 800
  br i1 %64, label %60, label %4, !llvm.loop !13

65:                                               ; preds = %58, %142
  %66 = phi i64 [ %144, %142 ], [ 1, %58 ]
  %67 = phi i32 [ %143, %142 ], [ %59, %58 ]
  %68 = icmp eq i64 %66, 799
  %69 = add nuw nsw i64 %66, %9
  %70 = add nsw i64 %69, -1
  %71 = getelementptr inbounds i8, i8* %0, i64 %70
  %72 = load i8, i8* %71, align 1, !tbaa !7, !range !12
  br i1 %7, label %78, label %73

73:                                               ; preds = %65
  %74 = add nuw nsw i64 %69, 799
  %75 = getelementptr inbounds i8, i8* %0, i64 %74
  %76 = load i8, i8* %75, align 1, !tbaa !7, !range !12
  %77 = add nuw nsw i8 %76, %72
  br label %78

78:                                               ; preds = %73, %65
  %79 = phi i8 [ %77, %73 ], [ %72, %65 ]
  %80 = zext i8 %79 to i32
  br i1 %8, label %87, label %81

81:                                               ; preds = %78
  %82 = add nsw i64 %69, -801
  %83 = getelementptr inbounds i8, i8* %0, i64 %82
  %84 = load i8, i8* %83, align 1, !tbaa !7, !range !12
  %85 = zext i8 %84 to i32
  %86 = add nuw nsw i32 %85, %80
  br label %87

87:                                               ; preds = %81, %78
  %88 = phi i32 [ %86, %81 ], [ %80, %78 ]
  br i1 %68, label %110, label %89

89:                                               ; preds = %87
  %90 = add nuw nsw i64 %66, %9
  %91 = add nuw nsw i64 %90, 1
  %92 = getelementptr inbounds i8, i8* %0, i64 %91
  %93 = load i8, i8* %92, align 1, !tbaa !7, !range !12
  %94 = zext i8 %93 to i32
  %95 = add nuw nsw i32 %88, %94
  br i1 %7, label %102, label %96

96:                                               ; preds = %89
  %97 = add nuw nsw i64 %90, 801
  %98 = getelementptr inbounds i8, i8* %0, i64 %97
  %99 = load i8, i8* %98, align 1, !tbaa !7, !range !12
  %100 = zext i8 %99 to i32
  %101 = add nuw nsw i32 %95, %100
  br label %102

102:                                              ; preds = %96, %89
  %103 = phi i32 [ %101, %96 ], [ %95, %89 ]
  br i1 %8, label %110, label %104

104:                                              ; preds = %102
  %105 = add nsw i64 %90, -799
  %106 = getelementptr inbounds i8, i8* %0, i64 %105
  %107 = load i8, i8* %106, align 1, !tbaa !7, !range !12
  %108 = zext i8 %107 to i32
  %109 = add nuw nsw i32 %103, %108
  br label %110

110:                                              ; preds = %104, %102, %87
  %111 = phi i32 [ %109, %104 ], [ %103, %102 ], [ %88, %87 ]
  br i1 %7, label %118, label %112

112:                                              ; preds = %110
  %113 = add nuw nsw i64 %10, %66
  %114 = getelementptr inbounds i8, i8* %0, i64 %113
  %115 = load i8, i8* %114, align 1, !tbaa !7, !range !12
  %116 = zext i8 %115 to i32
  %117 = add nuw nsw i32 %111, %116
  br label %118

118:                                              ; preds = %112, %110
  %119 = phi i32 [ %117, %112 ], [ %111, %110 ]
  br i1 %8, label %126, label %120

120:                                              ; preds = %118
  %121 = add nsw i64 %11, %66
  %122 = getelementptr inbounds i8, i8* %0, i64 %121
  %123 = load i8, i8* %122, align 1, !tbaa !7, !range !12
  %124 = zext i8 %123 to i32
  %125 = add nuw nsw i32 %119, %124
  br label %126

126:                                              ; preds = %118, %120
  %127 = phi i32 [ %125, %120 ], [ %119, %118 ]
  %128 = add nuw nsw i64 %66, %9
  %129 = getelementptr inbounds [640000 x i8], [640000 x i8]* %2, i64 0, i64 %128
  %130 = load i8, i8* %129, align 1, !tbaa !7, !range !12
  %131 = icmp eq i8 %130, 0
  %132 = and i32 %127, -2
  %133 = icmp eq i32 %132, 2
  %134 = select i1 %131, i1 true, i1 %133
  br i1 %134, label %136, label %135

135:                                              ; preds = %126
  store i8 0, i8* %129, align 1, !tbaa !7
  br label %142

136:                                              ; preds = %126
  %137 = icmp eq i32 %127, 3
  %138 = select i1 %131, i1 %137, i1 false
  br i1 %138, label %139, label %140

139:                                              ; preds = %136
  store i8 1, i8* %129, align 1, !tbaa !7
  br label %142

140:                                              ; preds = %136
  %141 = add nsw i32 %67, 1
  br label %142

142:                                              ; preds = %139, %140, %135
  %143 = phi i32 [ %67, %135 ], [ %67, %139 ], [ %141, %140 ]
  %144 = add nuw nsw i64 %66, 1
  %145 = icmp eq i64 %144, 800
  br i1 %145, label %62, label %65, !llvm.loop !14

146:                                              ; preds = %60
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(640000) %0, i8* noundef nonnull align 16 dereferenceable(640000) %3, i64 640000, i1 false)
  br label %147

147:                                              ; preds = %60, %146
  %148 = phi i32 [ 1, %146 ], [ 0, %60 ]
  call void @llvm.lifetime.end.p0i8(i64 640000, i8* nonnull %3) #5
  ret i32 %148
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nofree nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.6"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8, !8, i64 0}
!8 = !{!"_Bool", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = distinct !{!11, !6}
!12 = !{i8 0, i8 2}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6, !15}
!15 = !{!"llvm.loop.peeled.count", i32 1}
