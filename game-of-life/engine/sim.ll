; ModuleID = 'sim.c'
source_filename = "sim.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.SDL_Window = type opaque
%struct.SDL_Renderer = type opaque
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%union.SDL_Event = type { %struct.SDL_SensorEvent, [8 x i8] }
%struct.SDL_SensorEvent = type { i32, i32, i32, [6 x float], i64 }

@Win.1 = internal unnamed_addr global %struct.SDL_Window* null, align 8
@Win.2 = internal unnamed_addr global %struct.SDL_Renderer* null, align 8
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [32 x i8] c"Need to specify name of window\0A\00", align 1
@.str.1 = private unnamed_addr constant [29 x i8] c"Failed to create SDL window\0A\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"Failed to create SDL renderer\0A\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"Game of Life\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @destroyWindow() local_unnamed_addr #0 {
  %1 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @Win.2, align 8, !tbaa !5
  tail call void @SDL_DestroyRenderer(%struct.SDL_Renderer* noundef %1) #5
  %2 = load %struct.SDL_Window*, %struct.SDL_Window** @Win.1, align 8, !tbaa !11
  tail call void @SDL_DestroyWindow(%struct.SDL_Window* noundef %2) #5
  tail call void @SDL_Quit() #5
  ret void
}

declare void @SDL_DestroyRenderer(%struct.SDL_Renderer* noundef) local_unnamed_addr #1

declare void @SDL_DestroyWindow(%struct.SDL_Window* noundef) local_unnamed_addr #1

declare void @SDL_Quit() local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local void @setPixel(i32 noundef %0, i32 noundef %1, i32 %2) local_unnamed_addr #0 {
  %4 = trunc i32 %2 to i8
  %5 = lshr i32 %2, 8
  %6 = trunc i32 %5 to i8
  %7 = lshr i32 %2, 16
  %8 = trunc i32 %7 to i8
  %9 = lshr i32 %2, 24
  %10 = trunc i32 %9 to i8
  %11 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @Win.2, align 8, !tbaa !5
  %12 = tail call i32 @SDL_SetRenderDrawColor(%struct.SDL_Renderer* noundef %11, i8 noundef zeroext %4, i8 noundef zeroext %6, i8 noundef zeroext %8, i8 noundef zeroext %10) #5
  %13 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @Win.2, align 8, !tbaa !5
  %14 = tail call i32 @SDL_RenderDrawPoint(%struct.SDL_Renderer* noundef %13, i32 noundef %0, i32 noundef %1) #5
  ret void
}

declare i32 @SDL_SetRenderDrawColor(%struct.SDL_Renderer* noundef, i8 noundef zeroext, i8 noundef zeroext, i8 noundef zeroext, i8 noundef zeroext) local_unnamed_addr #1

declare i32 @SDL_RenderDrawPoint(%struct.SDL_Renderer* noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local zeroext i1 @isOpenWindow(i8* noundef %0) local_unnamed_addr #0 {
  %2 = alloca %union.SDL_Event, align 8
  %3 = bitcast %union.SDL_Event* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %3) #5
  %4 = call i32 @SDL_PollEvent(%union.SDL_Event* noundef nonnull %2) #5
  %5 = icmp ne i32 %4, 0
  %6 = getelementptr inbounds %union.SDL_Event, %union.SDL_Event* %2, i64 0, i32 0, i32 0
  %7 = load i32, i32* %6, align 8
  %8 = icmp eq i32 %7, 512
  %9 = select i1 %5, i1 %8, i1 false
  %10 = getelementptr inbounds %union.SDL_Event, %union.SDL_Event* %2, i64 0, i32 0, i32 3
  %11 = bitcast [6 x float]* %10 to i8*
  %12 = load i8, i8* %11, align 4
  %13 = icmp eq i8 %12, 14
  %14 = select i1 %9, i1 %13, i1 false
  br i1 %14, label %24, label %15

15:                                               ; preds = %1
  %16 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @Win.2, align 8, !tbaa !5
  %17 = call i32 @SDL_SetRenderDrawColor(%struct.SDL_Renderer* noundef %16, i8 noundef zeroext 0, i8 noundef zeroext 0, i8 noundef zeroext 0, i8 noundef zeroext -1) #5
  %18 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @Win.2, align 8, !tbaa !5
  %19 = call i32 @SDL_RenderClear(%struct.SDL_Renderer* noundef %18) #5
  %20 = call i32 @app(i8* noundef %0) #5
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %24, label %22

22:                                               ; preds = %15
  %23 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @Win.2, align 8, !tbaa !5
  call void @SDL_RenderPresent(%struct.SDL_Renderer* noundef %23) #5
  br label %24

24:                                               ; preds = %15, %1, %22
  %25 = phi i1 [ true, %22 ], [ false, %1 ], [ false, %15 ]
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %3) #5
  ret i1 %25
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

declare i32 @SDL_PollEvent(%union.SDL_Event* noundef) local_unnamed_addr #1

declare i32 @SDL_RenderClear(%struct.SDL_Renderer* noundef) local_unnamed_addr #1

declare i32 @app(i8* noundef) local_unnamed_addr #1

declare void @SDL_RenderPresent(%struct.SDL_Renderer* noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define dso_local i32 @simInit(i8* noundef %0, i8* nocapture noundef writeonly %1) local_unnamed_addr #0 {
  %3 = icmp eq i8* %0, null
  br i1 %3, label %4, label %7

4:                                                ; preds = %2
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %5) #6
  br label %37

7:                                                ; preds = %2
  %8 = tail call %struct.SDL_Window* @SDL_CreateWindow(i8* noundef nonnull %0, i32 noundef 805240832, i32 noundef 805240832, i32 noundef 800, i32 noundef 800, i32 noundef 0) #5
  store %struct.SDL_Window* %8, %struct.SDL_Window** @Win.1, align 8, !tbaa !11
  %9 = icmp eq %struct.SDL_Window* %8, null
  br i1 %9, label %10, label %13

10:                                               ; preds = %7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1, i64 0, i64 0), i64 28, i64 1, %struct._IO_FILE* %11) #6
  br label %37

13:                                               ; preds = %7
  %14 = tail call %struct.SDL_Renderer* @SDL_CreateRenderer(%struct.SDL_Window* noundef nonnull %8, i32 noundef -1, i32 noundef 0) #5
  store %struct.SDL_Renderer* %14, %struct.SDL_Renderer** @Win.2, align 8, !tbaa !5
  %15 = icmp eq %struct.SDL_Renderer* %14, null
  br i1 %15, label %16, label %19

16:                                               ; preds = %13
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0), i64 30, i64 1, %struct._IO_FILE* %17) #6
  br label %37

19:                                               ; preds = %13
  %20 = tail call i64 @time(i64* noundef null) #5
  %21 = trunc i64 %20 to i32
  tail call void @srand(i32 noundef %21) #5
  br label %22

22:                                               ; preds = %19, %25
  %23 = phi i64 [ 0, %19 ], [ %26, %25 ]
  %24 = mul nuw nsw i64 %23, 800
  br label %28

25:                                               ; preds = %28
  %26 = add nuw nsw i64 %23, 1
  %27 = icmp eq i64 %26, 800
  br i1 %27, label %37, label %22, !llvm.loop !13

28:                                               ; preds = %22, %28
  %29 = phi i64 [ 0, %22 ], [ %35, %28 ]
  %30 = tail call i32 @rand() #5
  %31 = add nuw nsw i64 %29, %24
  %32 = getelementptr inbounds i8, i8* %1, i64 %31
  %33 = trunc i32 %30 to i8
  %34 = and i8 %33, 1
  store i8 %34, i8* %32, align 1, !tbaa !15
  %35 = add nuw nsw i64 %29, 1
  %36 = icmp eq i64 %35, 800
  br i1 %36, label %25, label %28, !llvm.loop !17

37:                                               ; preds = %25, %16, %10, %4
  %38 = phi i32 [ -1, %16 ], [ -1, %10 ], [ -1, %4 ], [ 0, %25 ]
  ret i32 %38
}

declare %struct.SDL_Window* @SDL_CreateWindow(i8* noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

declare %struct.SDL_Renderer* @SDL_CreateRenderer(%struct.SDL_Window* noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
declare void @srand(i32 noundef) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @time(i64* noundef) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [640000 x i8], align 16
  %2 = getelementptr inbounds [640000 x i8], [640000 x i8]* %1, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 640000, i8* nonnull %2) #5
  %3 = call i32 @simInit(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i8* noundef nonnull %2)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %9

5:                                                ; preds = %0
  %6 = call zeroext i1 @isOpenWindow(i8* noundef nonnull %2)
  %7 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @Win.2, align 8, !tbaa !5
  call void @SDL_DestroyRenderer(%struct.SDL_Renderer* noundef %7) #5
  %8 = load %struct.SDL_Window*, %struct.SDL_Window** @Win.1, align 8, !tbaa !11
  call void @SDL_DestroyWindow(%struct.SDL_Window* noundef %8) #5
  call void @SDL_Quit() #5
  br label %9

9:                                                ; preds = %0, %5
  %10 = phi i32 [ 0, %5 ], [ -1, %0 ]
  call void @llvm.lifetime.end.p0i8(i64 640000, i8* nonnull %2) #5
  ret i32 %10
}

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(i8* nocapture noundef, i64 noundef, i64 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #4

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.6"}
!5 = !{!6, !10, i64 16}
!6 = !{!"SDLWindow", !7, i64 0, !10, i64 8, !10, i64 16}
!7 = !{!"long long", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"any pointer", !8, i64 0}
!11 = !{!6, !10, i64 8}
!12 = !{!10, !10, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!16, !16, i64 0}
!16 = !{!"_Bool", !8, i64 0}
!17 = distinct !{!17, !14}
