# How to build

```
clang++ -O2 ./Pass.cpp -c -fPIC -I`llvm-config --includedir` -o Pass.o
clang++ Pass.o -fPIC -shared -o libPass.so
clang++ -O2 log.cpp -fPIC -c -o log.o
clang -Xclang -load -Xclang ./libPass.so engine/app.c engine/sim.c log.o -O2 -lSDL2 -lstdc++ -flegacy-pass-manager -o GameOfLife
```

you would get an executable 'GameOfLife' file

# Statistic 
```
%8 = icmp eq i32 %7, 512 --- 1
  %2 = getelementptr inbounds [640000 x i8], [640000 x i8]* %1, i64 0, i64 0 --- 1
  %16 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @Win.2, align 8, !tbaa !5 --- 1
  %2 = alloca [640000 x i8], align 16 --- 1
  %7 = load i32, i32* %6, align 8 --- 1
  ret i32 %38 --- 1
  %4 = icmp eq i32 %3, 0 --- 1
  store %struct.SDL_Window* %8, %struct.SDL_Window** @Win.1, align 8, !tbaa !9 --- 1
  call void @SDL_RenderPresent(%struct.SDL_Renderer* noundef %23) #5 --- 1
  br i1 %3, label %4, label %7 --- 1
  %5 = icmp ne i32 %4, 0 --- 1
  %14 = select i1 %9, i1 %13, i1 false --- 1
  %3 = bitcast %union.SDL_Event* %2 to i8* --- 1
  %61 = icmp eq i32 %143, 640000 --- 1
  %12 = load i8, i8* %11, align 4 --- 1
  %17 = call i32 @SDL_SetRenderDrawColor(%struct.SDL_Renderer* noundef %16, i8 noundef zeroext 0, i8 noundef zeroext 0, i8 noundef zeroext 0, i8 noundef zeroext -1) #5 --- 1
  br i1 %61, label %165, label %146 --- 1
  br i1 %4, label %5, label %9 --- 1
  %9 = select i1 %5, i1 %8, i1 false --- 1
  %8 = load %struct.SDL_Window*, %struct.SDL_Window** @Win.1, align 8, !tbaa !11 --- 1
  br i1 %21, label %24, label %22 --- 1
  %11 = bitcast [6 x float]* %10 to i8* --- 1
  %3 = getelementptr inbounds [640000 x i8], [640000 x i8]* %2, i64 0, i64 0 --- 1
  br i1 %14, label %24, label %15 --- 1
  %19 = call i32 @SDL_RenderClear(%struct.SDL_Renderer* noundef %18) #5 --- 1
  %18 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @Win.2, align 8, !tbaa !5 --- 1
  ret i32 %166 --- 1
  %20 = call i32 @app(i8* noundef %0) #5 --- 1
  call void @llvm.lifetime.end.p0i8(i64 640000, i8* nonnull %2) #5 --- 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(640000) %3, i8* noundef nonnull align 1 dereferenceable(640000) %0, i64 640000, i1 false) --- 1
  call void @llvm.lifetime.start.p0i8(i64 640000, i8* nonnull %3) #4 --- 1
  %9 = icmp eq %struct.SDL_Window* %8, null --- 1
  %2 = alloca %union.SDL_Event, align 8 --- 1
  br label %24 --- 1
  %6 = call zeroext i1 @isOpenWindow(i8* noundef nonnull %2) --- 1
  %6 = getelementptr inbounds %union.SDL_Event, %union.SDL_Event* %2, i64 0, i32 0, i32 0 --- 1
  call void @SDL_DestroyRenderer(%struct.SDL_Renderer* noundef %7) #5 --- 1
  br label %4 --- 1
  store %struct.SDL_Renderer* %14, %struct.SDL_Renderer** @Win.2, align 8, !tbaa !12 --- 1
  br i1 %9, label %10, label %13 --- 1
  %4 = call i32 @SDL_PollEvent(%union.SDL_Event* noundef nonnull %2) #5 --- 1
  %1 = alloca [640000 x i8], align 16 --- 1
  br label %22 --- 1
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %3) #5 --- 1
  call void @SDL_DestroyWindow(%struct.SDL_Window* noundef %8) #5 --- 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(640000) %0, i8* noundef nonnull align 16 dereferenceable(640000) %3, i64 640000, i1 false) --- 1
  tail call void @srand(i32 noundef %21) #6 --- 1
  %14 = tail call %struct.SDL_Renderer* @SDL_CreateRenderer(%struct.SDL_Window* noundef nonnull %8, i32 noundef -1, i32 noundef 0) #6 --- 1
  %21 = trunc i64 %20 to i32 --- 1
  br i1 %15, label %16, label %19 --- 1
  call void @llvm.lifetime.start.p0i8(i64 640000, i8* nonnull %2) #5 --- 1
  %20 = tail call i64 @time(i64* noundef null) #6 --- 1
  %10 = getelementptr inbounds %union.SDL_Event, %union.SDL_Event* %2, i64 0, i32 0, i32 3 --- 1
  %8 = tail call %struct.SDL_Window* @SDL_CreateWindow(i8* noundef nonnull %0, i32 noundef 805240832, i32 noundef 805240832, i32 noundef 800, i32 noundef 800, i32 noundef 0) #6 --- 1
  %3 = call i32 @simInit(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i8* noundef nonnull %2) --- 1
  %3 = icmp eq i8* %0, null --- 1
  %13 = icmp eq i8 %12, 14 --- 1
  %15 = icmp eq %struct.SDL_Renderer* %14, null --- 1
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %3) #5 --- 1
  %21 = icmp eq i32 %20, 0 --- 1
  %7 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @Win.2, align 8, !tbaa !5 --- 1
  call void @SDL_Quit() #5 --- 1
  %23 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @Win.2, align 8, !tbaa !5 --- 1
  br label %147 --- 1
  call void @llvm.lifetime.end.p0i8(i64 640000, i8* nonnull %3) #4 --- 1
  br label %9 --- 1
  ret i1 %25 --- 1
  store i8 1, i8* %45, align 16, !tbaa !5 --- 102
  store i8 0, i8* %45, align 16, !tbaa !5 --- 155
  %56 = add nsw i32 %6, 1 --- 543
  %53 = icmp eq i32 %44, 3 --- 645
  br i1 %54, label %57, label %55 --- 645
  %54 = select i1 %47, i1 %53, i1 false --- 645
  br label %43 --- 799
  br label %29 --- 799
  %27 = zext i8 %26 to i32 --- 799
  %42 = add nuw nsw i32 %37, %41 --- 799
  %32 = getelementptr inbounds i8, i8* %0, i64 %10 --- 799
  %24 = add nsw i64 %9, -799 --- 799
  %39 = getelementptr inbounds i8, i8* %0, i64 %11 --- 799
  %16 = add nuw nsw i64 %9, 801 --- 799
  %28 = add nuw nsw i32 %22, %27 --- 799
  %17 = getelementptr inbounds i8, i8* %0, i64 %16 --- 799
  %18 = load i8, i8* %17, align 1, !tbaa !5, !range !9 --- 799
  %41 = zext i8 %40 to i32 --- 799
  %33 = load i8, i8* %32, align 1, !tbaa !5, !range !9 --- 799
  br label %36 --- 799
  %35 = add nuw nsw i32 %30, %34 --- 799
  %25 = getelementptr inbounds i8, i8* %0, i64 %24 --- 799
  br label %20 --- 799
  %34 = zext i8 %33 to i32 --- 799
  %40 = load i8, i8* %39, align 1, !tbaa !5, !range !9 --- 799
  %19 = add nuw nsw i8 %14, %18 --- 799
  %26 = load i8, i8* %25, align 1, !tbaa !5, !range !9 --- 799
  br i1 %7, label %36, label %31 --- 800
  br i1 %8, label %43, label %38 --- 800
  %27 = icmp eq i64 %26, 800 --- 800
  %14 = load i8, i8* %13, align 1, !tbaa !5, !range !9 --- 800
  %153 = icmp eq i64 %152, 800 --- 800
  %13 = getelementptr inbounds i8, i8* %0, i64 %12 --- 800
  %48 = and i32 %44, -2 --- 800
  br i1 %8, label %29, label %23 --- 800
  %12 = or i64 %9, 1 --- 800
  %10 = add nuw nsw i64 %9, 800 --- 800
  %9 = mul nuw nsw i64 %5, 800 --- 800
  %152 = add nuw nsw i64 %148, 1 --- 800
  %8 = icmp eq i64 %5, 799 --- 800
  %7 = icmp eq i64 %5, 0 --- 800
  %149 = mul nuw nsw i64 %148, 800 --- 800
  %26 = add nuw nsw i64 %23, 1 --- 800
  %11 = add nsw i64 %9, -800 --- 800
  br label %58 --- 800
  %50 = select i1 %47, i1 true, i1 %49 --- 800
  %22 = zext i8 %21 to i32 --- 800
  %24 = mul nuw nsw i64 %23, 800 --- 800
  %150 = trunc i64 %148 to i32 --- 800
  br label %154 --- 800
  %47 = icmp eq i8 %46, 0 --- 800
  %45 = getelementptr inbounds [640000 x i8], [640000 x i8]* %2, i64 0, i64 %9 --- 800
  %64 = icmp eq i64 %63, 800 --- 800
  br i1 %27, label %37, label %22, !llvm.loop !13 --- 800
  br i1 %64, label %60, label %4, !llvm.loop !10 --- 800
  %49 = icmp eq i32 %48, 2 --- 800
  %46 = load i8, i8* %45, align 16, !tbaa !5, !range !9 --- 800
  br i1 %7, label %20, label %15 --- 800
  br label %28 --- 800
  br label %65 --- 800
  br i1 %153, label %165, label %147, !llvm.loop !14 --- 800
  br i1 %50, label %52, label %51 --- 800
  %63 = add nuw nsw i64 %5, 1 --- 800
  store i8 1, i8* %129, align 1, !tbaa !5 --- 69601
  %7 = lshr i32 %2, 16 --- 174470
  %10 = trunc i32 %9 to i8 --- 174470
  br label %162 --- 174470
  %13 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @Win.2, align 8, !tbaa !5 --- 174470
  %161 = trunc i64 %155 to i32 --- 174470
  tail call void @setPixel(i32 noundef %150, i32 noundef %161, i32 -16776961) #4 --- 174470
  %12 = tail call i32 @SDL_SetRenderDrawColor(%struct.SDL_Renderer* noundef %11, i8 noundef zeroext %4, i8 noundef zeroext %6, i8 noundef zeroext %8, i8 noundef zeroext %10) #5 --- 174470
  %4 = trunc i32 %2 to i8 --- 174470
  %5 = lshr i32 %2, 8 --- 174470
  %14 = tail call i32 @SDL_RenderDrawPoint(%struct.SDL_Renderer* noundef %13, i32 noundef %0, i32 noundef %1) #5 --- 174470
  %8 = trunc i32 %7 to i8 --- 174470
  %6 = trunc i32 %5 to i8 --- 174470
  %11 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** @Win.2, align 8, !tbaa !5 --- 174470
  %9 = lshr i32 %2, 24 --- 174470
  ret void --- 174470
  store i8 0, i8* %129, align 1, !tbaa !5 --- 215343
  %141 = add nsw i32 %67, 1 --- 354256
  %138 = select i1 %131, i1 %137, i1 false --- 423857
  %137 = icmp eq i32 %127, 3 --- 423857
  br i1 %138, label %139, label %140 --- 423857
  %105 = add nsw i64 %90, -799 --- 637602
  %109 = add nuw nsw i32 %103, %108 --- 637602
  %99 = load i8, i8* %98, align 1, !tbaa !5, !range !9 --- 637602
  %106 = getelementptr inbounds i8, i8* %0, i64 %105 --- 637602
  %108 = zext i8 %107 to i32 --- 637602
  %97 = add nuw nsw i64 %90, 801 --- 637602
  %98 = getelementptr inbounds i8, i8* %0, i64 %97 --- 637602
  %100 = zext i8 %99 to i32 --- 637602
  br label %110 --- 637602
  %107 = load i8, i8* %106, align 1, !tbaa !5, !range !9 --- 637602
  %101 = add nuw nsw i32 %95, %100 --- 637602
  br label %102 --- 637602
  %95 = add nuw nsw i32 %88, %94 --- 638400
  br i1 %7, label %102, label %96 --- 638400
  %93 = load i8, i8* %92, align 1, !tbaa !5, !range !9 --- 638400
  %90 = add nuw nsw i64 %66, %9 --- 638400
  %91 = add nuw nsw i64 %90, 1 --- 638400
  %94 = zext i8 %93 to i32 --- 638400
  br i1 %8, label %110, label %104 --- 638400
  %92 = getelementptr inbounds i8, i8* %0, i64 %91 --- 638400
  %85 = zext i8 %84 to i32 --- 638401
  %82 = add nsw i64 %69, -801 --- 638401
  %123 = load i8, i8* %122, align 1, !tbaa !5, !range !9 --- 638401
  %83 = getelementptr inbounds i8, i8* %0, i64 %82 --- 638401
  %122 = getelementptr inbounds i8, i8* %0, i64 %121 --- 638401
  %124 = zext i8 %123 to i32 --- 638401
  %125 = add nuw nsw i32 %119, %124 --- 638401
  br label %126 --- 638401
  %77 = add nuw nsw i8 %76, %72 --- 638401
  %113 = add nuw nsw i64 %10, %66 --- 638401
  %84 = load i8, i8* %83, align 1, !tbaa !5, !range !9 --- 638401
  %114 = getelementptr inbounds i8, i8* %0, i64 %113 --- 638401
  %117 = add nuw nsw i32 %111, %116 --- 638401
  %74 = add nuw nsw i64 %69, 799 --- 638401
  %75 = getelementptr inbounds i8, i8* %0, i64 %74 --- 638401
  %121 = add nsw i64 %11, %66 --- 638401
  br label %118 --- 638401
  br label %87 --- 638401
  %115 = load i8, i8* %114, align 1, !tbaa !5, !range !9 --- 638401
  %86 = add nuw nsw i32 %85, %80 --- 638401
  %116 = zext i8 %115 to i32 --- 638401
  br label %78 --- 638401
  %76 = load i8, i8* %75, align 1, !tbaa !5, !range !9 --- 638401
  %132 = and i32 %127, -2 --- 639200
  br label %142 --- 639200
  %80 = zext i8 %79 to i32 --- 639200
  br i1 %68, label %110, label %89 --- 639200
  %71 = getelementptr inbounds i8, i8* %0, i64 %70 --- 639200
  br i1 %8, label %87, label %81 --- 639200
  br i1 %8, label %126, label %120 --- 639200
  %131 = icmp eq i8 %130, 0 --- 639200
  %128 = add nuw nsw i64 %66, %9 --- 639200
  %70 = add nsw i64 %69, -1 --- 639200
  %129 = getelementptr inbounds [640000 x i8], [640000 x i8]* %2, i64 0, i64 %128 --- 639200
  %133 = icmp eq i32 %132, 2 --- 639200
  br i1 %134, label %136, label %135 --- 639200
  %144 = add nuw nsw i64 %66, 1 --- 639200
  br i1 %7, label %118, label %112 --- 639200
  br i1 %145, label %62, label %65, !llvm.loop !12 --- 639200
  %68 = icmp eq i64 %66, 799 --- 639200
  %145 = icmp eq i64 %144, 800 --- 639200
  %72 = load i8, i8* %71, align 1, !tbaa !5, !range !9 --- 639200
  br i1 %7, label %78, label %73 --- 639200
  %69 = add nuw nsw i64 %66, %9 --- 639200
  %130 = load i8, i8* %129, align 1, !tbaa !5, !range !9 --- 639200
  %134 = select i1 %131, i1 true, i1 %133 --- 639200
  %156 = add nuw nsw i64 %155, %149 --- 640000
  %157 = getelementptr inbounds i8, i8* %0, i64 %156 --- 640000
  %163 = add nuw nsw i64 %155, 1 --- 640000
  %164 = icmp eq i64 %163, 800 --- 640000
  br i1 %164, label %151, label %154, !llvm.loop !15 --- 640000
  %159 = icmp eq i8 %158, 0 --- 640000
  %31 = add nuw nsw i64 %29, %24 --- 640000
  %34 = and i8 %33, 1 --- 640000
  br i1 %36, label %25, label %28, !llvm.loop !17 --- 640000
  %33 = trunc i32 %30 to i8 --- 640000
  %35 = add nuw nsw i64 %29, 1 --- 640000
  %32 = getelementptr inbounds i8, i8* %1, i64 %31 --- 640000
  %36 = icmp eq i64 %35, 800 --- 640000
  %30 = tail call i32 @rand() #6 --- 640000
  store i8 %34, i8* %32, align 1, !tbaa !15 --- 640000
  br i1 %159, label %162, label %160 --- 640000
  %158 = load i8, i8* %157, align 1, !tbaa !5, !range !9 --- 640000
```
