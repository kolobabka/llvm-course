# How to build

```
clang++ ./Pass.cpp -c -fPIC -I`llvm-config --includedir` -o Pass.o
clang++ Pass.o -fPIC -shared -o libPass.so
clang++ log.cpp -fPIC -c -o log.o
clang -Xclang -load -Xclang ./libPass.so main.c engine/engine.c log.o -O2 -lSDL2 -lstdc++ -flegacy-pass-manager -o GameOfLife
```

you would get an executable 'GameOfLife' file

# Statistic 
```
  %3 = alloca %union.SDL_Event, align 8 --- 1
  %13 = load i8, i8* %12, align 4 --- 1
  %2 = tail call i64 @time(i64* noundef null) #6 --- 1
  %3 = call i32 @initWindow(i64 noundef 800, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)) #3 --- 1
  %4 = icmp eq i32 %3, 0 --- 1
  %18 = call i32 @SDL_SetRenderDrawColor(%struct.SDL_Renderer* noundef %17, i8 noundef zeroext 0, i8 noundef zeroext 0, i8 noundef zeroext 0, i8 noundef zeroext -1) #6 --- 1
  %4 = bitcast %union.SDL_Event* %3 to i8* --- 1
  tail call void @srand(i32 noundef %3) #6 --- 1
  %14 = icmp eq i8 %13, 14 --- 1
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %4) #6 --- 1
  %10 = icmp eq %struct.SDL_Window* %9, null --- 1
  br i1 %4, label %5, label %7 --- 1
  %2 = alloca [640000 x i8], align 16 --- 1
  store %struct.SDL_Renderer* %15, %struct.SDL_Renderer** getelementptr inbounds (%struct.SDLWindow, %struct.SDLWindow* @Win, i64 0, i32 2), align 8, !tbaa !13 --- 1
  %15 = tail call %struct.SDL_Renderer* @SDL_CreateRenderer(%struct.SDL_Window* noundef nonnull %9, i32 noundef -1, i32 noundef 0) #7 --- 1
  %5 = call i32 @SDL_PollEvent(%union.SDL_Event* noundef nonnull %3) #6 --- 1
  %6 = icmp ne i32 %5, 0 --- 1
  %9 = tail call %struct.SDL_Window* @SDL_CreateWindow(i8* noundef nonnull %1, i32 noundef 805240832, i32 noundef 805240832, i32 noundef %8, i32 noundef %8, i32 noundef 0) #7 --- 1
  br label %188 --- 1
  %10 = select i1 %6, i1 %9, i1 false --- 1
  %19 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** getelementptr inbounds (%struct.SDLWindow, %struct.SDLWindow* @Win, i64 0, i32 2), align 8, !tbaa !5 --- 1
  call void @llvm.lifetime.end.p0i8(i64 640000, i8* nonnull %21) #6 --- 1
  %8 = load i32, i32* %7, align 8 --- 1
  %9 = icmp eq i32 %8, 512 --- 1
  %11 = getelementptr inbounds %union.SDL_Event, %union.SDL_Event* %3, i64 0, i32 0, i32 3 --- 1
  %12 = bitcast [6 x float]* %11 to i8* --- 1
  tail call void @SDL_DestroyWindow(%struct.SDL_Window* noundef %2) #6 --- 1
  %15 = select i1 %10, i1 %14, i1 false --- 1
  %21 = getelementptr inbounds [640000 x i8], [640000 x i8]* %2, i64 0, i64 0 --- 1
  br label %4 --- 1
  call void @llvm.lifetime.start.p0i8(i64 640000, i8* nonnull %21) #6 --- 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(640000) %0, i8* noundef nonnull align 16 dereferenceable(640000) %21, i64 640000, i1 false) #6 --- 1
  ret i32 %21 --- 1
  %7 = getelementptr inbounds %union.SDL_Event, %union.SDL_Event* %3, i64 0, i32 0, i32 0 --- 1
  call void @SDL_RenderPresent(%struct.SDL_Renderer* noundef %187) #6 --- 1
  call void (...) @destroyWindow() #3 --- 1
  store %struct.SDL_Window* %9, %struct.SDL_Window** getelementptr inbounds (%struct.SDLWindow, %struct.SDLWindow* @Win, i64 0, i32 1), align 8, !tbaa !12 --- 1
  %2 = load %struct.SDL_Window*, %struct.SDL_Window** getelementptr inbounds (%struct.SDLWindow, %struct.SDLWindow* @Win, i64 0, i32 1), align 8, !tbaa !11 --- 1
  store i64 %0, i64* getelementptr inbounds (%struct.SDLWindow, %struct.SDLWindow* @Win, i64 0, i32 0), align 8, !tbaa !9 --- 1
  %8 = trunc i64 %0 to i32 --- 1
  br label %164 --- 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(640000) %21, i8* noundef nonnull align 1 dereferenceable(640000) %0, i64 640000, i1 false) #6 --- 1
  br label %7 --- 1
  %20 = call i32 @SDL_RenderClear(%struct.SDL_Renderer* noundef %19) #6 --- 1
  %3 = icmp eq i8* %1, null --- 1
  br i1 %16, label %17, label %20 --- 1
  %6 = call zeroext i1 @isOpenWindow(i8* noundef nonnull %2) #3 --- 1
  br i1 %3, label %4, label %7 --- 1
  ret i1 %189 --- 1
  br i1 %10, label %11, label %14 --- 1
  %1 = alloca [640000 x i8], align 16 --- 1
  %16 = icmp eq %struct.SDL_Renderer* %15, null --- 1
  call void @llvm.lifetime.start.p0i8(i64 640000, i8* nonnull %2) #3 --- 1
  call void @initGameSpace(i8* noundef nonnull %2) #3 --- 1
  %2 = getelementptr inbounds [640000 x i8], [640000 x i8]* %1, i64 0, i64 0 --- 1
  %3 = trunc i64 %2 to i32 --- 1
  br i1 %15, label %188, label %16 --- 1
  call void @llvm.lifetime.end.p0i8(i64 640000, i8* nonnull %2) #3 --- 1
  tail call void @SDL_Quit() #6 --- 1
  tail call void @SDL_DestroyRenderer(%struct.SDL_Renderer* noundef %1) #6 --- 1
  %1 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** getelementptr inbounds (%struct.SDLWindow, %struct.SDLWindow* @Win, i64 0, i32 2), align 8, !tbaa !5 --- 1
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %4) #6 --- 1
  %187 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** getelementptr inbounds (%struct.SDLWindow, %struct.SDLWindow* @Win, i64 0, i32 2), align 8, !tbaa !5 --- 1
  br i1 %79, label %80, label %163 --- 1
  %79 = icmp eq i32 %160, 640000 --- 1
  br label %22 --- 1
  %17 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** getelementptr inbounds (%struct.SDLWindow, %struct.SDLWindow* @Win, i64 0, i32 2), align 8, !tbaa !5 --- 1
  ret void --- 2
  store i8 1, i8* %63, align 16, !tbaa !11 --- 125
  store i8 0, i8* %63, align 16, !tbaa !11 --- 153
  %76 = add nsw i32 %24, 1 --- 522
  %74 = select i1 %65, i1 %73, i1 false --- 647
  %73 = icmp eq i32 %62, 3 --- 647
  br i1 %74, label %77, label %75 --- 647
  %37 = add nuw nsw i8 %36, %32 --- 799
  %43 = getelementptr inbounds i8, i8* %0, i64 %42 --- 799
  %44 = load i8, i8* %43, align 1, !tbaa !11, !range !13 --- 799
  br label %54 --- 799
  %57 = getelementptr inbounds i8, i8* %0, i64 %29 --- 799
  br label %61 --- 799
  %51 = load i8, i8* %50, align 1, !tbaa !11, !range !13 --- 799
  %36 = load i8, i8* %35, align 1, !tbaa !11, !range !13 --- 799
  %53 = add nuw nsw i32 %48, %52 --- 799
  %50 = getelementptr inbounds i8, i8* %0, i64 %28 --- 799
  %34 = add nuw nsw i64 %27, 801 --- 799
  %58 = load i8, i8* %57, align 1, !tbaa !11, !range !13 --- 799
  %59 = zext i8 %58 to i32 --- 799
  %60 = add nuw nsw i32 %55, %59 --- 799
  br label %38 --- 799
  %52 = zext i8 %51 to i32 --- 799
  %45 = zext i8 %44 to i32 --- 799
  %35 = getelementptr inbounds i8, i8* %0, i64 %34 --- 799
  %42 = add nsw i64 %27, -799 --- 799
  %46 = add nuw nsw i32 %45, %40 --- 799
  br label %47 --- 799
  %31 = getelementptr inbounds i8, i8* %0, i64 %30 --- 800
  %65 = icmp eq i8 %64, 0 --- 800
  %63 = getelementptr inbounds [640000 x i8], [640000 x i8]* %2, i64 0, i64 %27 --- 800
  %66 = and i32 %62, -2 --- 800
  br label %11 --- 800
  %166 = mul nuw nsw i64 %165, 800 --- 800
  %9 = add nuw nsw i64 %5, 1 --- 800
  br i1 %26, label %47, label %41 --- 800
  %10 = icmp eq i64 %9, 800 --- 800
  %40 = zext i8 %39 to i32 --- 800
  %32 = load i8, i8* %31, align 1, !tbaa !11, !range !13 --- 800
  %29 = add nsw i64 %27, -800 --- 800
  %28 = add nuw nsw i64 %27, 800 --- 800
  %25 = icmp eq i64 %23, 0 --- 800
  %27 = mul nuw nsw i64 %23, 800 --- 800
  %26 = icmp eq i64 %23, 799 --- 800
  br i1 %25, label %38, label %33 --- 800
  br i1 %83, label %78, label %22, !llvm.loop !14 --- 800
  br label %171 --- 800
  %167 = trunc i64 %165 to i32 --- 800
  %82 = add nuw nsw i64 %23, 1 --- 800
  %83 = icmp eq i64 %82, 800 --- 800
  %64 = load i8, i8* %63, align 16, !tbaa !11, !range !13 --- 800
  %6 = mul nuw nsw i64 %5, 800 --- 800
  br i1 %10, label %7, label %4, !llvm.loop !5 --- 800
  %68 = select i1 %65, i1 true, i1 %67 --- 800
  br label %70 --- 800
  br i1 %170, label %186, label %164, !llvm.loop !18 --- 800
  %30 = or i64 %27, 1 --- 800
  br i1 %68, label %72, label %69 --- 800
  br i1 %26, label %61, label %56 --- 800
  br i1 %25, label %54, label %49 --- 800
  %170 = icmp eq i64 %169, 800 --- 800
  %67 = icmp eq i32 %66, 2 --- 800
  br label %84 --- 800
  %169 = add nuw nsw i64 %165, 1 --- 800
  store i8 1, i8* %146, align 1, !tbaa !11 --- 70402
  %181 = trunc i64 %172 to i32 --- 176483
  %182 = call i32 @SDL_RenderDrawPoint(%struct.SDL_Renderer* noundef %180, i32 noundef %167, i32 noundef %181) #6 --- 176483
  %180 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** getelementptr inbounds (%struct.SDLWindow, %struct.SDLWindow* @Win, i64 0, i32 2), align 8, !tbaa !5 --- 176483
  %179 = call i32 @SDL_SetRenderDrawColor(%struct.SDL_Renderer* noundef %178, i8 noundef zeroext -1, i8 noundef zeroext 0, i8 noundef zeroext 0, i8 noundef zeroext -1) #6 --- 176483
  %178 = load %struct.SDL_Renderer*, %struct.SDL_Renderer** getelementptr inbounds (%struct.SDLWindow, %struct.SDLWindow* @Win, i64 0, i32 2), align 8, !tbaa !5 --- 176483
  br label %183 --- 176483
  store i8 0, i8* %146, align 1, !tbaa !11 --- 212980
  %158 = add nsw i32 %86, 1 --- 355818
  %155 = select i1 %148, i1 %154, i1 false --- 426220
  %154 = icmp eq i32 %145, 3 --- 426220
  br i1 %155, label %156, label %157 --- 426220
  %118 = zext i8 %117 to i32 --- 637602
  %126 = zext i8 %125 to i32 --- 637602
  %125 = load i8, i8* %124, align 1, !tbaa !11, !range !13 --- 637602
  %117 = load i8, i8* %116, align 1, !tbaa !11, !range !13 --- 637602
  %124 = getelementptr inbounds i8, i8* %0, i64 %123 --- 637602
  %115 = add nuw nsw i64 %88, 801 --- 637602
  %127 = add nuw nsw i32 %121, %126 --- 637602
  br label %120 --- 637602
  %119 = add nuw nsw i32 %113, %118 --- 637602
  %116 = getelementptr inbounds i8, i8* %0, i64 %115 --- 637602
  br label %128 --- 637602
  %123 = add nsw i64 %88, -799 --- 637602
  br i1 %26, label %128, label %122 --- 638400
  %111 = load i8, i8* %110, align 1, !tbaa !11, !range !13 --- 638400
  %109 = add nuw nsw i64 %88, 1 --- 638400
  br i1 %25, label %120, label %114 --- 638400
  %112 = zext i8 %111 to i32 --- 638400
  %110 = getelementptr inbounds i8, i8* %0, i64 %109 --- 638400
  %113 = add nuw nsw i32 %107, %112 --- 638400
  %140 = getelementptr inbounds i8, i8* %0, i64 %139 --- 638401
  %103 = load i8, i8* %102, align 1, !tbaa !11, !range !13 --- 638401
  %143 = add nuw nsw i32 %137, %142 --- 638401
  br label %144 --- 638401
  %96 = add nuw nsw i8 %95, %91 --- 638401
  br label %106 --- 638401
  %105 = add nuw nsw i32 %104, %99 --- 638401
  %104 = zext i8 %103 to i32 --- 638401
  %139 = add nsw i64 %85, %29 --- 638401
  %93 = add nuw nsw i64 %88, 799 --- 638401
  %102 = getelementptr inbounds i8, i8* %0, i64 %101 --- 638401
  %132 = getelementptr inbounds i8, i8* %0, i64 %131 --- 638401
  %134 = zext i8 %133 to i32 --- 638401
  %131 = add nuw nsw i64 %85, %28 --- 638401
  br label %136 --- 638401
  %135 = add nuw nsw i32 %129, %134 --- 638401
  %141 = load i8, i8* %140, align 1, !tbaa !11, !range !13 --- 638401
  %133 = load i8, i8* %132, align 1, !tbaa !11, !range !13 --- 638401
  br label %97 --- 638401
  %101 = add nsw i64 %88, -801 --- 638401
  %95 = load i8, i8* %94, align 1, !tbaa !11, !range !13 --- 638401
  %94 = getelementptr inbounds i8, i8* %0, i64 %93 --- 638401
  %142 = zext i8 %141 to i32 --- 638401
  br i1 %87, label %128, label %108 --- 639200
  %162 = icmp eq i64 %161, 800 --- 639200
  %87 = icmp eq i64 %85, 799 --- 639200
  %88 = add nuw nsw i64 %85, %27 --- 639200
  %148 = icmp eq i8 %147, 0 --- 639200
  br label %159 --- 639200
  br i1 %162, label %81, label %84, !llvm.loop !16 --- 639200
  br i1 %26, label %106, label %100 --- 639200
  %91 = load i8, i8* %90, align 1, !tbaa !11, !range !13 --- 639200
  %89 = add nsw i64 %88, -1 --- 639200
  br i1 %26, label %144, label %138 --- 639200
  br i1 %25, label %97, label %92 --- 639200
  %161 = add nuw nsw i64 %85, 1 --- 639200
  %99 = zext i8 %98 to i32 --- 639200
  %149 = and i32 %145, -2 --- 639200
  %151 = select i1 %148, i1 true, i1 %150 --- 639200
  %150 = icmp eq i32 %149, 2 --- 639200
  %147 = load i8, i8* %146, align 1, !tbaa !11, !range !13 --- 639200
  %90 = getelementptr inbounds i8, i8* %0, i64 %89 --- 639200
  br i1 %151, label %153, label %152 --- 639200
  %146 = getelementptr inbounds [640000 x i8], [640000 x i8]* %2, i64 0, i64 %88 --- 639200
  br i1 %25, label %136, label %130 --- 639200
  br i1 %19, label %8, label %11, !llvm.loop !11 --- 640000
  %15 = getelementptr inbounds i8, i8* %0, i64 %14 --- 640000
  %16 = trunc i32 %13 to i8 --- 640000
  %176 = icmp eq i8 %175, 0 --- 640000
  %19 = icmp eq i64 %18, 800 --- 640000
  %174 = getelementptr inbounds i8, i8* %0, i64 %173 --- 640000
  %14 = add nuw nsw i64 %12, %6 --- 640000
  %184 = add nuw nsw i64 %172, 1 --- 640000
  store i8 %17, i8* %15, align 1, !tbaa !7 --- 640000
  br i1 %185, label %168, label %171, !llvm.loop !19 --- 640000
  %18 = add nuw nsw i64 %12, 1 --- 640000
  %173 = add nuw nsw i64 %172, %166 --- 640000
  %185 = icmp eq i64 %184, 800 --- 640000
  %17 = and i8 %16, 1 --- 640000
  %175 = load i8, i8* %174, align 1, !tbaa !11, !range !13 --- 640000
  br i1 %176, label %183, label %177 --- 640000
  %13 = tail call i32 @rand() #6 --- 640000

```