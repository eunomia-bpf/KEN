; ModuleID = './01_interpolant_unsat.c'
source_filename = "./01_interpolant_unsat.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

@.str = private unnamed_addr constant [8 x i8] c"partial\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [25 x i8] c"./01_interpolant_unsat.c\00", section "llvm.metadata"
@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32, i8* }] [{ i8*, i8*, i8*, i32, i8* } { i8* bitcast (i1 (i32, i32)* @itp to i8*), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i32 0, i32 0), i32 26, i8* null }], section "llvm.metadata"

; Function Attrs: noinline nounwind
define dso_local zeroext i1 @itp(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4, !tbaa !3
  store i32 %1, i32* %4, align 4, !tbaa !3
  %5 = load i32, i32* %3, align 4, !tbaa !3
  %6 = load i32, i32* %4, align 4, !tbaa !3
  %7 = call zeroext i1 @infer(i32 noundef %5, i32 noundef %6)
  ret i1 %7
}

declare dso_local zeroext i1 @infer(i32 noundef, i32 noundef) #1

; Function Attrs: nounwind
define dso_local i32 @main1123123() #2 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #4
  %8 = call i32 bitcast (i32 (...)* @nd1 to i32 ()*)()
  store i32 %8, i32* %1, align 4, !tbaa !3
  %9 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #4
  %10 = call i32 bitcast (i32 (...)* @nd2 to i32 ()*)()
  store i32 %10, i32* %2, align 4, !tbaa !3
  %11 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #4
  %12 = call i32 bitcast (i32 (...)* @nd3 to i32 ()*)()
  store i32 %12, i32* %3, align 4, !tbaa !3
  %13 = load i32, i32* %1, align 4, !tbaa !3
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %21

15:                                               ; preds = %0
  %16 = load i32, i32* %2, align 4, !tbaa !3
  %17 = load i32, i32* %3, align 4, !tbaa !3
  %18 = mul nsw i32 2, %17
  %19 = add nsw i32 %18, 6
  %20 = icmp eq i32 %16, %19
  br label %21

21:                                               ; preds = %15, %0
  %22 = phi i1 [ false, %0 ], [ %20, %15 ]
  call void @__SEA_assume(i1 noundef zeroext %22)
  %23 = load i32, i32* %2, align 4, !tbaa !3
  %24 = load i32, i32* %3, align 4, !tbaa !3
  %25 = call zeroext i1 @itp(i32 noundef %23, i32 noundef %24)
  call void @__VERIFIER_assert(i1 noundef zeroext %25)
  %26 = load i32, i32* %2, align 4, !tbaa !3
  %27 = load i32, i32* %3, align 4, !tbaa !3
  %28 = call zeroext i1 @itp(i32 noundef %26, i32 noundef %27)
  br i1 %28, label %30, label %29

29:                                               ; preds = %21
  call void @__VERIFIER_error()
  br label %30

30:                                               ; preds = %29, %21
  %31 = phi i1 [ true, %21 ], [ false, %29 ]
  %32 = zext i1 %31 to i32
  %33 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %33) #4
  %34 = call i32 bitcast (i32 (...)* @nd4 to i32 ()*)()
  store i32 %34, i32* %4, align 4, !tbaa !3
  %35 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %35) #4
  %36 = call i32 bitcast (i32 (...)* @nd5 to i32 ()*)()
  store i32 %36, i32* %5, align 4, !tbaa !3
  %37 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %37) #4
  %38 = call i32 bitcast (i32 (...)* @nd6 to i32 ()*)()
  store i32 %38, i32* %6, align 4, !tbaa !3
  %39 = load i32, i32* %5, align 4, !tbaa !3
  %40 = load i32, i32* %6, align 4, !tbaa !3
  %41 = call zeroext i1 @itp(i32 noundef %39, i32 noundef %40)
  call void @__SEA_assume(i1 noundef zeroext %41)
  %42 = load i32, i32* %4, align 4, !tbaa !3
  %43 = icmp slt i32 %42, 7
  br i1 %43, label %44, label %52

44:                                               ; preds = %30
  %45 = load i32, i32* %5, align 4, !tbaa !3
  %46 = load i32, i32* %6, align 4, !tbaa !3
  %47 = mul nsw i32 -4, %46
  %48 = icmp eq i32 %45, %47
  br i1 %48, label %49, label %52

49:                                               ; preds = %44
  %50 = load i32, i32* %5, align 4, !tbaa !3
  %51 = icmp ne i32 %50, 4
  br label %52

52:                                               ; preds = %49, %44, %30
  %53 = phi i1 [ false, %44 ], [ false, %30 ], [ %51, %49 ]
  %54 = xor i1 %53, true
  call void @__VERIFIER_assert(i1 noundef zeroext %54)
  %55 = load i32, i32* %4, align 4, !tbaa !3
  %56 = icmp slt i32 %55, 7
  br i1 %56, label %57, label %65

57:                                               ; preds = %52
  %58 = load i32, i32* %5, align 4, !tbaa !3
  %59 = load i32, i32* %6, align 4, !tbaa !3
  %60 = mul nsw i32 -4, %59
  %61 = icmp eq i32 %58, %60
  br i1 %61, label %62, label %65

62:                                               ; preds = %57
  %63 = load i32, i32* %5, align 4, !tbaa !3
  %64 = icmp ne i32 %63, 4
  br label %65

65:                                               ; preds = %62, %57, %52
  %66 = phi i1 [ false, %57 ], [ false, %52 ], [ %64, %62 ]
  %67 = xor i1 %66, true
  br i1 %67, label %69, label %68

68:                                               ; preds = %65
  call void @__VERIFIER_error()
  br label %69

69:                                               ; preds = %68, %65
  %70 = phi i1 [ true, %65 ], [ false, %68 ]
  %71 = zext i1 %70 to i32
  %72 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %72) #4
  %73 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %73) #4
  %74 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %74) #4
  %75 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %75) #4
  %76 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %76) #4
  %77 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %77) #4
  ret i32 0
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

declare dso_local i32 @nd1(...) #1

declare dso_local i32 @nd2(...) #1

declare dso_local i32 @nd3(...) #1

declare dso_local void @__SEA_assume(i1 noundef zeroext) #1

declare dso_local void @__VERIFIER_assert(i1 noundef zeroext) #1

declare dso_local void @__VERIFIER_error() #1

declare dso_local i32 @nd4(...) #1

declare dso_local i32 @nd5(...) #1

declare dso_local i32 @nd6(...) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

attributes #0 = { noinline nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #2 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
