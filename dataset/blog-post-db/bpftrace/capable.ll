; ModuleID = 'bpftrace'
source_filename = "bpftrace"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf-pc-linux"

%printf_t.0 = type { i64, [5 x i8], [4 x i8], [4 x i8], [5 x i8], [4 x i8], [5 x i8] }
%printf_t = type { i64 }
%printf_t.1 = type { i64, i64, i64, [16 x i8], i64, [23 x i8], i64 }
%time_t = type <{ i64, i32 }>
%clear_t = type <{ i64, i32 }>

; Function Attrs: nounwind
declare i64 @llvm.bpf.pseudo(i64 %0, i64 %1) #0

define i64 @BEGIN(i8* %0) local_unnamed_addr section "s_BEGIN_1" {
entry:
  %"@cap_key207" = alloca i64, align 8
  %str206 = alloca [23 x i8], align 1
  %"@cap_val203" = alloca [23 x i8], align 1
  %"@cap_key202" = alloca i64, align 8
  %"@cap_val198" = alloca [23 x i8], align 1
  %"@cap_key197" = alloca i64, align 8
  %"@cap_val193" = alloca [23 x i8], align 1
  %"@cap_key192" = alloca i64, align 8
  %"@cap_val188" = alloca [23 x i8], align 1
  %"@cap_key187" = alloca i64, align 8
  %"@cap_val183" = alloca [23 x i8], align 1
  %"@cap_key182" = alloca i64, align 8
  %"@cap_val178" = alloca [23 x i8], align 1
  %"@cap_key177" = alloca i64, align 8
  %"@cap_val173" = alloca [23 x i8], align 1
  %"@cap_key172" = alloca i64, align 8
  %"@cap_val168" = alloca [23 x i8], align 1
  %"@cap_key167" = alloca i64, align 8
  %"@cap_val163" = alloca [23 x i8], align 1
  %"@cap_key162" = alloca i64, align 8
  %"@cap_val158" = alloca [23 x i8], align 1
  %"@cap_key157" = alloca i64, align 8
  %"@cap_val153" = alloca [23 x i8], align 1
  %"@cap_key152" = alloca i64, align 8
  %"@cap_val148" = alloca [23 x i8], align 1
  %"@cap_key147" = alloca i64, align 8
  %"@cap_val143" = alloca [23 x i8], align 1
  %"@cap_key142" = alloca i64, align 8
  %"@cap_val138" = alloca [23 x i8], align 1
  %"@cap_key137" = alloca i64, align 8
  %"@cap_val133" = alloca [23 x i8], align 1
  %"@cap_key132" = alloca i64, align 8
  %"@cap_val128" = alloca [23 x i8], align 1
  %"@cap_key127" = alloca i64, align 8
  %"@cap_val123" = alloca [23 x i8], align 1
  %"@cap_key122" = alloca i64, align 8
  %"@cap_val118" = alloca [23 x i8], align 1
  %"@cap_key117" = alloca i64, align 8
  %"@cap_val113" = alloca [23 x i8], align 1
  %"@cap_key112" = alloca i64, align 8
  %"@cap_val108" = alloca [23 x i8], align 1
  %"@cap_key107" = alloca i64, align 8
  %"@cap_val103" = alloca [23 x i8], align 1
  %"@cap_key102" = alloca i64, align 8
  %"@cap_val98" = alloca [23 x i8], align 1
  %"@cap_key97" = alloca i64, align 8
  %"@cap_val93" = alloca [23 x i8], align 1
  %"@cap_key92" = alloca i64, align 8
  %"@cap_val88" = alloca [23 x i8], align 1
  %"@cap_key87" = alloca i64, align 8
  %"@cap_val83" = alloca [23 x i8], align 1
  %"@cap_key82" = alloca i64, align 8
  %"@cap_val78" = alloca [23 x i8], align 1
  %"@cap_key77" = alloca i64, align 8
  %"@cap_val73" = alloca [23 x i8], align 1
  %"@cap_key72" = alloca i64, align 8
  %"@cap_val68" = alloca [23 x i8], align 1
  %"@cap_key67" = alloca i64, align 8
  %"@cap_val63" = alloca [23 x i8], align 1
  %"@cap_key62" = alloca i64, align 8
  %"@cap_val58" = alloca [23 x i8], align 1
  %"@cap_key57" = alloca i64, align 8
  %"@cap_val53" = alloca [23 x i8], align 1
  %"@cap_key52" = alloca i64, align 8
  %"@cap_val48" = alloca [23 x i8], align 1
  %"@cap_key47" = alloca i64, align 8
  %"@cap_val43" = alloca [23 x i8], align 1
  %"@cap_key42" = alloca i64, align 8
  %"@cap_val38" = alloca [23 x i8], align 1
  %"@cap_key37" = alloca i64, align 8
  %"@cap_val33" = alloca [23 x i8], align 1
  %"@cap_key32" = alloca i64, align 8
  %"@cap_val28" = alloca [23 x i8], align 1
  %"@cap_key27" = alloca i64, align 8
  %"@cap_val23" = alloca [23 x i8], align 1
  %"@cap_key22" = alloca i64, align 8
  %"@cap_val18" = alloca [23 x i8], align 1
  %"@cap_key17" = alloca i64, align 8
  %"@cap_val13" = alloca [23 x i8], align 1
  %"@cap_key12" = alloca i64, align 8
  %"@cap_val" = alloca [23 x i8], align 1
  %"@cap_key" = alloca i64, align 8
  %printf_args1 = alloca %printf_t.0, align 8
  %printf_args = alloca %printf_t, align 8
  %1 = bitcast %printf_t* %printf_args to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %1)
  %2 = getelementptr inbounds %printf_t, %printf_t* %printf_args, i64 0, i32 0
  store i64 0, i64* %2, align 8
  %pseudo = tail call i64 @llvm.bpf.pseudo(i64 1, i64 1)
  %perf_event_output = call i64 inttoptr (i64 25 to i64 (i8*, i64, i64, %printf_t*, i64)*)(i8* %0, i64 %pseudo, i64 4294967295, %printf_t* nonnull %printf_args, i64 8)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %1)
  %3 = bitcast %printf_t.0* %printf_args1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %3)
  %4 = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 6, i64 2
  %5 = bitcast i8* %4 to i64*
  store i64 0, i64* %5, align 8
  %6 = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 0
  store i64 1, i64* %6, align 8
  %str.sroa.0.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 1, i64 0
  store i8 84, i8* %str.sroa.0.0..sroa_idx, align 8
  %str.sroa.4.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 1, i64 1
  store i8 73, i8* %str.sroa.4.0..sroa_idx, align 1
  %str.sroa.5.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 1, i64 2
  store i8 77, i8* %str.sroa.5.0..sroa_idx, align 2
  %str.sroa.6.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 1, i64 3
  store i8 69, i8* %str.sroa.6.0..sroa_idx, align 1
  %str.sroa.7.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 1, i64 4
  store i8 0, i8* %str.sroa.7.0..sroa_idx, align 4
  %str2.sroa.0.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 2, i64 0
  store i8 85, i8* %str2.sroa.0.0..sroa_idx, align 1
  %str2.sroa.4.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 2, i64 1
  store i8 73, i8* %str2.sroa.4.0..sroa_idx, align 2
  %str2.sroa.5.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 2, i64 2
  store i8 68, i8* %str2.sroa.5.0..sroa_idx, align 1
  %str2.sroa.6.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 2, i64 3
  store i8 0, i8* %str2.sroa.6.0..sroa_idx, align 8
  %str3.sroa.0.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 3, i64 0
  store i8 80, i8* %str3.sroa.0.0..sroa_idx, align 1
  %str3.sroa.4.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 3, i64 1
  store i8 73, i8* %str3.sroa.4.0..sroa_idx, align 2
  %str3.sroa.5.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 3, i64 2
  store i8 68, i8* %str3.sroa.5.0..sroa_idx, align 1
  %str3.sroa.6.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 3, i64 3
  store i8 0, i8* %str3.sroa.6.0..sroa_idx, align 4
  %str4.sroa.0.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 4, i64 0
  store i8 67, i8* %str4.sroa.0.0..sroa_idx, align 1
  %str4.sroa.4.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 4, i64 1
  store i8 79, i8* %str4.sroa.4.0..sroa_idx, align 2
  %str4.sroa.5.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 4, i64 2
  store i8 77, i8* %str4.sroa.5.0..sroa_idx, align 1
  %str4.sroa.6.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 4, i64 3
  store i8 77, i8* %str4.sroa.6.0..sroa_idx, align 8
  %str4.sroa.7.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 4, i64 4
  store i8 0, i8* %str4.sroa.7.0..sroa_idx, align 1
  %str5.sroa.0.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 5, i64 0
  store i8 67, i8* %str5.sroa.0.0..sroa_idx, align 2
  %str5.sroa.4.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 5, i64 1
  store i8 65, i8* %str5.sroa.4.0..sroa_idx, align 1
  %str5.sroa.5.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 5, i64 2
  store i8 80, i8* %str5.sroa.5.0..sroa_idx, align 4
  %str5.sroa.6.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 5, i64 3
  store i8 0, i8* %str5.sroa.6.0..sroa_idx, align 1
  %str6.sroa.0.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 6, i64 0
  store i8 78, i8* %str6.sroa.0.0..sroa_idx, align 2
  %str6.sroa.4.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 6, i64 1
  store i8 65, i8* %str6.sroa.4.0..sroa_idx, align 1
  %str6.sroa.5.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 6, i64 2
  store i8 77, i8* %str6.sroa.5.0..sroa_idx, align 8
  %str6.sroa.6.0..sroa_idx = getelementptr inbounds %printf_t.0, %printf_t.0* %printf_args1, i64 0, i32 6, i64 3
  store i8 69, i8* %str6.sroa.6.0..sroa_idx, align 1
  %pseudo7 = call i64 @llvm.bpf.pseudo(i64 1, i64 1)
  %perf_event_output8 = call i64 inttoptr (i64 25 to i64 (i8*, i64, i64, %printf_t.0*, i64)*)(i8* %0, i64 %pseudo7, i64 4294967295, %printf_t.0* nonnull %printf_args1, i64 40)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %3)
  %7 = bitcast i64* %"@cap_key" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %7)
  store i64 0, i64* %"@cap_key", align 8
  %8 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %8)
  %9 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val", i64 0, i64 10
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %9, i8 0, i64 13, i1 false)
  store i8 67, i8* %8, align 1
  %str9.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val", i64 0, i64 1
  store i8 65, i8* %str9.sroa.4.0..sroa_idx, align 1
  %str9.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val", i64 0, i64 2
  store i8 80, i8* %str9.sroa.5.0..sroa_idx, align 1
  %str9.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val", i64 0, i64 3
  store i8 95, i8* %str9.sroa.6.0..sroa_idx, align 1
  %str9.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val", i64 0, i64 4
  store i8 67, i8* %str9.sroa.7.0..sroa_idx, align 1
  %str9.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val", i64 0, i64 5
  store i8 72, i8* %str9.sroa.8.0..sroa_idx, align 1
  %str9.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val", i64 0, i64 6
  store i8 79, i8* %str9.sroa.9.0..sroa_idx, align 1
  %str9.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val", i64 0, i64 7
  store i8 87, i8* %str9.sroa.10.0..sroa_idx, align 1
  %str9.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val", i64 0, i64 8
  store i8 78, i8* %str9.sroa.11.0..sroa_idx, align 1
  %str9.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val", i64 0, i64 9
  store i8 0, i8* %str9.sroa.12.0..sroa_idx, align 1
  %pseudo10 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo10, i64* nonnull %"@cap_key", [23 x i8]* nonnull %"@cap_val", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %8)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %7)
  %10 = bitcast i64* %"@cap_key12" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %10)
  store i64 1, i64* %"@cap_key12", align 8
  %11 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %11)
  %12 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 17
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %12, i8 0, i64 6, i1 false)
  store i8 67, i8* %11, align 1
  %str11.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 1
  store i8 65, i8* %str11.sroa.4.0..sroa_idx, align 1
  %str11.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 2
  store i8 80, i8* %str11.sroa.5.0..sroa_idx, align 1
  %str11.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 3
  store i8 95, i8* %str11.sroa.6.0..sroa_idx, align 1
  %str11.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 4
  store i8 68, i8* %str11.sroa.7.0..sroa_idx, align 1
  %str11.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 5
  store i8 65, i8* %str11.sroa.8.0..sroa_idx, align 1
  %str11.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 6
  store i8 67, i8* %str11.sroa.9.0..sroa_idx, align 1
  %str11.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 7
  store i8 95, i8* %str11.sroa.10.0..sroa_idx, align 1
  %str11.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 8
  store i8 79, i8* %str11.sroa.11.0..sroa_idx, align 1
  %str11.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 9
  store i8 86, i8* %str11.sroa.12.0..sroa_idx, align 1
  %str11.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 10
  store i8 69, i8* %str11.sroa.13.0..sroa_idx, align 1
  %str11.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 11
  store i8 82, i8* %str11.sroa.14.0..sroa_idx, align 1
  %str11.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 12
  store i8 82, i8* %str11.sroa.15.0..sroa_idx, align 1
  %str11.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 13
  store i8 73, i8* %str11.sroa.16.0..sroa_idx, align 1
  %str11.sroa.17.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 14
  store i8 68, i8* %str11.sroa.17.0..sroa_idx, align 1
  %str11.sroa.18.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 15
  store i8 69, i8* %str11.sroa.18.0..sroa_idx, align 1
  %str11.sroa.19.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val13", i64 0, i64 16
  store i8 0, i8* %str11.sroa.19.0..sroa_idx, align 1
  %pseudo14 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem15 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo14, i64* nonnull %"@cap_key12", [23 x i8]* nonnull %"@cap_val13", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %11)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %10)
  %13 = bitcast i64* %"@cap_key17" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %13)
  store i64 2, i64* %"@cap_key17", align 8
  %14 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %14)
  %15 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 20
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %15, i8 0, i64 3, i1 false)
  store i8 67, i8* %14, align 1
  %str16.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 1
  store i8 65, i8* %str16.sroa.4.0..sroa_idx, align 1
  %str16.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 2
  store i8 80, i8* %str16.sroa.5.0..sroa_idx, align 1
  %str16.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 3
  store i8 95, i8* %str16.sroa.6.0..sroa_idx, align 1
  %str16.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 4
  store i8 68, i8* %str16.sroa.7.0..sroa_idx, align 1
  %str16.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 5
  store i8 65, i8* %str16.sroa.8.0..sroa_idx, align 1
  %str16.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 6
  store i8 67, i8* %str16.sroa.9.0..sroa_idx, align 1
  %str16.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 7
  store i8 95, i8* %str16.sroa.10.0..sroa_idx, align 1
  %str16.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 8
  store i8 82, i8* %str16.sroa.11.0..sroa_idx, align 1
  %str16.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 9
  store i8 69, i8* %str16.sroa.12.0..sroa_idx, align 1
  %str16.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 10
  store i8 65, i8* %str16.sroa.13.0..sroa_idx, align 1
  %str16.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 11
  store i8 68, i8* %str16.sroa.14.0..sroa_idx, align 1
  %str16.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 12
  store i8 95, i8* %str16.sroa.15.0..sroa_idx, align 1
  %str16.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 13
  store i8 83, i8* %str16.sroa.16.0..sroa_idx, align 1
  %str16.sroa.17.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 14
  store i8 69, i8* %str16.sroa.17.0..sroa_idx, align 1
  %str16.sroa.18.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 15
  store i8 65, i8* %str16.sroa.18.0..sroa_idx, align 1
  %str16.sroa.19.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 16
  store i8 82, i8* %str16.sroa.19.0..sroa_idx, align 1
  %str16.sroa.20.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 17
  store i8 67, i8* %str16.sroa.20.0..sroa_idx, align 1
  %str16.sroa.21.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 18
  store i8 72, i8* %str16.sroa.21.0..sroa_idx, align 1
  %str16.sroa.22.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val18", i64 0, i64 19
  store i8 0, i8* %str16.sroa.22.0..sroa_idx, align 1
  %pseudo19 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem20 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo19, i64* nonnull %"@cap_key17", [23 x i8]* nonnull %"@cap_val18", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %14)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %13)
  %16 = bitcast i64* %"@cap_key22" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %16)
  store i64 3, i64* %"@cap_key22", align 8
  %17 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val23", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %17)
  %18 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val23", i64 0, i64 11
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %18, i8 0, i64 12, i1 false)
  store i8 67, i8* %17, align 1
  %str21.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val23", i64 0, i64 1
  store i8 65, i8* %str21.sroa.4.0..sroa_idx, align 1
  %str21.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val23", i64 0, i64 2
  store i8 80, i8* %str21.sroa.5.0..sroa_idx, align 1
  %str21.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val23", i64 0, i64 3
  store i8 95, i8* %str21.sroa.6.0..sroa_idx, align 1
  %str21.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val23", i64 0, i64 4
  store i8 70, i8* %str21.sroa.7.0..sroa_idx, align 1
  %str21.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val23", i64 0, i64 5
  store i8 79, i8* %str21.sroa.8.0..sroa_idx, align 1
  %str21.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val23", i64 0, i64 6
  store i8 87, i8* %str21.sroa.9.0..sroa_idx, align 1
  %str21.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val23", i64 0, i64 7
  store i8 78, i8* %str21.sroa.10.0..sroa_idx, align 1
  %str21.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val23", i64 0, i64 8
  store i8 69, i8* %str21.sroa.11.0..sroa_idx, align 1
  %str21.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val23", i64 0, i64 9
  store i8 82, i8* %str21.sroa.12.0..sroa_idx, align 1
  %str21.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val23", i64 0, i64 10
  store i8 0, i8* %str21.sroa.13.0..sroa_idx, align 1
  %pseudo24 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem25 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo24, i64* nonnull %"@cap_key22", [23 x i8]* nonnull %"@cap_val23", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %17)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %16)
  %19 = bitcast i64* %"@cap_key27" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %19)
  store i64 4, i64* %"@cap_key27", align 8
  %20 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val28", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %20)
  %21 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val28", i64 0, i64 11
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %21, i8 0, i64 12, i1 false)
  store i8 67, i8* %20, align 1
  %str26.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val28", i64 0, i64 1
  store i8 65, i8* %str26.sroa.4.0..sroa_idx, align 1
  %str26.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val28", i64 0, i64 2
  store i8 80, i8* %str26.sroa.5.0..sroa_idx, align 1
  %str26.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val28", i64 0, i64 3
  store i8 95, i8* %str26.sroa.6.0..sroa_idx, align 1
  %str26.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val28", i64 0, i64 4
  store i8 70, i8* %str26.sroa.7.0..sroa_idx, align 1
  %str26.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val28", i64 0, i64 5
  store i8 83, i8* %str26.sroa.8.0..sroa_idx, align 1
  %str26.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val28", i64 0, i64 6
  store i8 69, i8* %str26.sroa.9.0..sroa_idx, align 1
  %str26.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val28", i64 0, i64 7
  store i8 84, i8* %str26.sroa.10.0..sroa_idx, align 1
  %str26.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val28", i64 0, i64 8
  store i8 73, i8* %str26.sroa.11.0..sroa_idx, align 1
  %str26.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val28", i64 0, i64 9
  store i8 68, i8* %str26.sroa.12.0..sroa_idx, align 1
  %str26.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val28", i64 0, i64 10
  store i8 0, i8* %str26.sroa.13.0..sroa_idx, align 1
  %pseudo29 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem30 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo29, i64* nonnull %"@cap_key27", [23 x i8]* nonnull %"@cap_val28", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %20)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %19)
  %22 = bitcast i64* %"@cap_key32" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %22)
  store i64 5, i64* %"@cap_key32", align 8
  %23 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val33", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %23)
  %24 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val33", i64 0, i64 9
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %24, i8 0, i64 14, i1 false)
  store i8 67, i8* %23, align 1
  %str31.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val33", i64 0, i64 1
  store i8 65, i8* %str31.sroa.4.0..sroa_idx, align 1
  %str31.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val33", i64 0, i64 2
  store i8 80, i8* %str31.sroa.5.0..sroa_idx, align 1
  %str31.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val33", i64 0, i64 3
  store i8 95, i8* %str31.sroa.6.0..sroa_idx, align 1
  %str31.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val33", i64 0, i64 4
  store i8 75, i8* %str31.sroa.7.0..sroa_idx, align 1
  %str31.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val33", i64 0, i64 5
  store i8 73, i8* %str31.sroa.8.0..sroa_idx, align 1
  %str31.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val33", i64 0, i64 6
  store i8 76, i8* %str31.sroa.9.0..sroa_idx, align 1
  %str31.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val33", i64 0, i64 7
  store i8 76, i8* %str31.sroa.10.0..sroa_idx, align 1
  %str31.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val33", i64 0, i64 8
  store i8 0, i8* %str31.sroa.11.0..sroa_idx, align 1
  %pseudo34 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem35 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo34, i64* nonnull %"@cap_key32", [23 x i8]* nonnull %"@cap_val33", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %23)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %22)
  %25 = bitcast i64* %"@cap_key37" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %25)
  store i64 6, i64* %"@cap_key37", align 8
  %26 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val38", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %26)
  %27 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val38", i64 0, i64 11
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %27, i8 0, i64 12, i1 false)
  store i8 67, i8* %26, align 1
  %str36.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val38", i64 0, i64 1
  store i8 65, i8* %str36.sroa.4.0..sroa_idx, align 1
  %str36.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val38", i64 0, i64 2
  store i8 80, i8* %str36.sroa.5.0..sroa_idx, align 1
  %str36.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val38", i64 0, i64 3
  store i8 95, i8* %str36.sroa.6.0..sroa_idx, align 1
  %str36.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val38", i64 0, i64 4
  store i8 83, i8* %str36.sroa.7.0..sroa_idx, align 1
  %str36.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val38", i64 0, i64 5
  store i8 69, i8* %str36.sroa.8.0..sroa_idx, align 1
  %str36.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val38", i64 0, i64 6
  store i8 84, i8* %str36.sroa.9.0..sroa_idx, align 1
  %str36.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val38", i64 0, i64 7
  store i8 71, i8* %str36.sroa.10.0..sroa_idx, align 1
  %str36.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val38", i64 0, i64 8
  store i8 73, i8* %str36.sroa.11.0..sroa_idx, align 1
  %str36.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val38", i64 0, i64 9
  store i8 68, i8* %str36.sroa.12.0..sroa_idx, align 1
  %str36.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val38", i64 0, i64 10
  store i8 0, i8* %str36.sroa.13.0..sroa_idx, align 1
  %pseudo39 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem40 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo39, i64* nonnull %"@cap_key37", [23 x i8]* nonnull %"@cap_val38", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %26)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %25)
  %28 = bitcast i64* %"@cap_key42" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %28)
  store i64 7, i64* %"@cap_key42", align 8
  %29 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val43", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %29)
  %30 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val43", i64 0, i64 11
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %30, i8 0, i64 12, i1 false)
  store i8 67, i8* %29, align 1
  %str41.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val43", i64 0, i64 1
  store i8 65, i8* %str41.sroa.4.0..sroa_idx, align 1
  %str41.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val43", i64 0, i64 2
  store i8 80, i8* %str41.sroa.5.0..sroa_idx, align 1
  %str41.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val43", i64 0, i64 3
  store i8 95, i8* %str41.sroa.6.0..sroa_idx, align 1
  %str41.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val43", i64 0, i64 4
  store i8 83, i8* %str41.sroa.7.0..sroa_idx, align 1
  %str41.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val43", i64 0, i64 5
  store i8 69, i8* %str41.sroa.8.0..sroa_idx, align 1
  %str41.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val43", i64 0, i64 6
  store i8 84, i8* %str41.sroa.9.0..sroa_idx, align 1
  %str41.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val43", i64 0, i64 7
  store i8 85, i8* %str41.sroa.10.0..sroa_idx, align 1
  %str41.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val43", i64 0, i64 8
  store i8 73, i8* %str41.sroa.11.0..sroa_idx, align 1
  %str41.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val43", i64 0, i64 9
  store i8 68, i8* %str41.sroa.12.0..sroa_idx, align 1
  %str41.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val43", i64 0, i64 10
  store i8 0, i8* %str41.sroa.13.0..sroa_idx, align 1
  %pseudo44 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem45 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo44, i64* nonnull %"@cap_key42", [23 x i8]* nonnull %"@cap_val43", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %29)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %28)
  %31 = bitcast i64* %"@cap_key47" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %31)
  store i64 8, i64* %"@cap_key47", align 8
  %32 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val48", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %32)
  %33 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val48", i64 0, i64 12
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %33, i8 0, i64 11, i1 false)
  store i8 67, i8* %32, align 1
  %str46.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val48", i64 0, i64 1
  store i8 65, i8* %str46.sroa.4.0..sroa_idx, align 1
  %str46.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val48", i64 0, i64 2
  store i8 80, i8* %str46.sroa.5.0..sroa_idx, align 1
  %str46.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val48", i64 0, i64 3
  store i8 95, i8* %str46.sroa.6.0..sroa_idx, align 1
  %str46.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val48", i64 0, i64 4
  store i8 83, i8* %str46.sroa.7.0..sroa_idx, align 1
  %str46.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val48", i64 0, i64 5
  store i8 69, i8* %str46.sroa.8.0..sroa_idx, align 1
  %str46.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val48", i64 0, i64 6
  store i8 84, i8* %str46.sroa.9.0..sroa_idx, align 1
  %str46.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val48", i64 0, i64 7
  store i8 80, i8* %str46.sroa.10.0..sroa_idx, align 1
  %str46.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val48", i64 0, i64 8
  store i8 67, i8* %str46.sroa.11.0..sroa_idx, align 1
  %str46.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val48", i64 0, i64 9
  store i8 65, i8* %str46.sroa.12.0..sroa_idx, align 1
  %str46.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val48", i64 0, i64 10
  store i8 80, i8* %str46.sroa.13.0..sroa_idx, align 1
  %str46.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val48", i64 0, i64 11
  store i8 0, i8* %str46.sroa.14.0..sroa_idx, align 1
  %pseudo49 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem50 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo49, i64* nonnull %"@cap_key47", [23 x i8]* nonnull %"@cap_val48", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %32)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %31)
  %34 = bitcast i64* %"@cap_key52" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %34)
  store i64 9, i64* %"@cap_key52", align 8
  %35 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %35)
  %36 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 20
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %36, i8 0, i64 3, i1 false)
  store i8 67, i8* %35, align 1
  %str51.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 1
  store i8 65, i8* %str51.sroa.4.0..sroa_idx, align 1
  %str51.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 2
  store i8 80, i8* %str51.sroa.5.0..sroa_idx, align 1
  %str51.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 3
  store i8 95, i8* %str51.sroa.6.0..sroa_idx, align 1
  %str51.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 4
  store i8 76, i8* %str51.sroa.7.0..sroa_idx, align 1
  %str51.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 5
  store i8 73, i8* %str51.sroa.8.0..sroa_idx, align 1
  %str51.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 6
  store i8 78, i8* %str51.sroa.9.0..sroa_idx, align 1
  %str51.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 7
  store i8 85, i8* %str51.sroa.10.0..sroa_idx, align 1
  %str51.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 8
  store i8 88, i8* %str51.sroa.11.0..sroa_idx, align 1
  %str51.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 9
  store i8 95, i8* %str51.sroa.12.0..sroa_idx, align 1
  %str51.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 10
  store i8 73, i8* %str51.sroa.13.0..sroa_idx, align 1
  %str51.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 11
  store i8 77, i8* %str51.sroa.14.0..sroa_idx, align 1
  %str51.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 12
  store i8 77, i8* %str51.sroa.15.0..sroa_idx, align 1
  %str51.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 13
  store i8 85, i8* %str51.sroa.16.0..sroa_idx, align 1
  %str51.sroa.17.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 14
  store i8 84, i8* %str51.sroa.17.0..sroa_idx, align 1
  %str51.sroa.18.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 15
  store i8 65, i8* %str51.sroa.18.0..sroa_idx, align 1
  %str51.sroa.19.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 16
  store i8 66, i8* %str51.sroa.19.0..sroa_idx, align 1
  %str51.sroa.20.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 17
  store i8 76, i8* %str51.sroa.20.0..sroa_idx, align 1
  %str51.sroa.21.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 18
  store i8 69, i8* %str51.sroa.21.0..sroa_idx, align 1
  %str51.sroa.22.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val53", i64 0, i64 19
  store i8 0, i8* %str51.sroa.22.0..sroa_idx, align 1
  %pseudo54 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem55 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo54, i64* nonnull %"@cap_key52", [23 x i8]* nonnull %"@cap_val53", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %35)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %34)
  %37 = bitcast i64* %"@cap_key57" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %37)
  store i64 10, i64* %"@cap_key57", align 8
  %38 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %38)
  %39 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 21
  %40 = bitcast i8* %39 to i16*
  store i16 0, i16* %40, align 1
  store i8 67, i8* %38, align 1
  %str56.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 1
  store i8 65, i8* %str56.sroa.4.0..sroa_idx, align 1
  %str56.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 2
  store i8 80, i8* %str56.sroa.5.0..sroa_idx, align 1
  %str56.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 3
  store i8 95, i8* %str56.sroa.6.0..sroa_idx, align 1
  %str56.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 4
  store i8 78, i8* %str56.sroa.7.0..sroa_idx, align 1
  %str56.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 5
  store i8 69, i8* %str56.sroa.8.0..sroa_idx, align 1
  %str56.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 6
  store i8 84, i8* %str56.sroa.9.0..sroa_idx, align 1
  %str56.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 7
  store i8 95, i8* %str56.sroa.10.0..sroa_idx, align 1
  %str56.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 8
  store i8 66, i8* %str56.sroa.11.0..sroa_idx, align 1
  %str56.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 9
  store i8 73, i8* %str56.sroa.12.0..sroa_idx, align 1
  %str56.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 10
  store i8 78, i8* %str56.sroa.13.0..sroa_idx, align 1
  %str56.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 11
  store i8 68, i8* %str56.sroa.14.0..sroa_idx, align 1
  %str56.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 12
  store i8 95, i8* %str56.sroa.15.0..sroa_idx, align 1
  %str56.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 13
  store i8 83, i8* %str56.sroa.16.0..sroa_idx, align 1
  %str56.sroa.17.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 14
  store i8 69, i8* %str56.sroa.17.0..sroa_idx, align 1
  %str56.sroa.18.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 15
  store i8 82, i8* %str56.sroa.18.0..sroa_idx, align 1
  %str56.sroa.19.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 16
  store i8 86, i8* %str56.sroa.19.0..sroa_idx, align 1
  %str56.sroa.20.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 17
  store i8 73, i8* %str56.sroa.20.0..sroa_idx, align 1
  %str56.sroa.21.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 18
  store i8 67, i8* %str56.sroa.21.0..sroa_idx, align 1
  %str56.sroa.22.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 19
  store i8 69, i8* %str56.sroa.22.0..sroa_idx, align 1
  %str56.sroa.23.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val58", i64 0, i64 20
  store i8 0, i8* %str56.sroa.23.0..sroa_idx, align 1
  %pseudo59 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem60 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo59, i64* nonnull %"@cap_key57", [23 x i8]* nonnull %"@cap_val58", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %38)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %37)
  %41 = bitcast i64* %"@cap_key62" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %41)
  store i64 11, i64* %"@cap_key62", align 8
  %42 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %42)
  %43 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 18
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %43, i8 0, i64 5, i1 false)
  store i8 67, i8* %42, align 1
  %str61.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 1
  store i8 65, i8* %str61.sroa.4.0..sroa_idx, align 1
  %str61.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 2
  store i8 80, i8* %str61.sroa.5.0..sroa_idx, align 1
  %str61.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 3
  store i8 95, i8* %str61.sroa.6.0..sroa_idx, align 1
  %str61.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 4
  store i8 78, i8* %str61.sroa.7.0..sroa_idx, align 1
  %str61.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 5
  store i8 69, i8* %str61.sroa.8.0..sroa_idx, align 1
  %str61.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 6
  store i8 84, i8* %str61.sroa.9.0..sroa_idx, align 1
  %str61.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 7
  store i8 95, i8* %str61.sroa.10.0..sroa_idx, align 1
  %str61.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 8
  store i8 66, i8* %str61.sroa.11.0..sroa_idx, align 1
  %str61.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 9
  store i8 82, i8* %str61.sroa.12.0..sroa_idx, align 1
  %str61.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 10
  store i8 79, i8* %str61.sroa.13.0..sroa_idx, align 1
  %str61.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 11
  store i8 65, i8* %str61.sroa.14.0..sroa_idx, align 1
  %str61.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 12
  store i8 68, i8* %str61.sroa.15.0..sroa_idx, align 1
  %str61.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 13
  store i8 67, i8* %str61.sroa.16.0..sroa_idx, align 1
  %str61.sroa.17.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 14
  store i8 65, i8* %str61.sroa.17.0..sroa_idx, align 1
  %str61.sroa.18.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 15
  store i8 83, i8* %str61.sroa.18.0..sroa_idx, align 1
  %str61.sroa.19.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 16
  store i8 84, i8* %str61.sroa.19.0..sroa_idx, align 1
  %str61.sroa.20.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val63", i64 0, i64 17
  store i8 0, i8* %str61.sroa.20.0..sroa_idx, align 1
  %pseudo64 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem65 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo64, i64* nonnull %"@cap_key62", [23 x i8]* nonnull %"@cap_val63", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %42)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %41)
  %44 = bitcast i64* %"@cap_key67" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %44)
  store i64 12, i64* %"@cap_key67", align 8
  %45 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val68", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %45)
  %46 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val68", i64 0, i64 14
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %46, i8 0, i64 9, i1 false)
  store i8 67, i8* %45, align 1
  %str66.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val68", i64 0, i64 1
  store i8 65, i8* %str66.sroa.4.0..sroa_idx, align 1
  %str66.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val68", i64 0, i64 2
  store i8 80, i8* %str66.sroa.5.0..sroa_idx, align 1
  %str66.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val68", i64 0, i64 3
  store i8 95, i8* %str66.sroa.6.0..sroa_idx, align 1
  %str66.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val68", i64 0, i64 4
  store i8 78, i8* %str66.sroa.7.0..sroa_idx, align 1
  %str66.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val68", i64 0, i64 5
  store i8 69, i8* %str66.sroa.8.0..sroa_idx, align 1
  %str66.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val68", i64 0, i64 6
  store i8 84, i8* %str66.sroa.9.0..sroa_idx, align 1
  %str66.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val68", i64 0, i64 7
  store i8 95, i8* %str66.sroa.10.0..sroa_idx, align 1
  %str66.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val68", i64 0, i64 8
  store i8 65, i8* %str66.sroa.11.0..sroa_idx, align 1
  %str66.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val68", i64 0, i64 9
  store i8 68, i8* %str66.sroa.12.0..sroa_idx, align 1
  %str66.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val68", i64 0, i64 10
  store i8 77, i8* %str66.sroa.13.0..sroa_idx, align 1
  %str66.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val68", i64 0, i64 11
  store i8 73, i8* %str66.sroa.14.0..sroa_idx, align 1
  %str66.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val68", i64 0, i64 12
  store i8 78, i8* %str66.sroa.15.0..sroa_idx, align 1
  %str66.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val68", i64 0, i64 13
  store i8 0, i8* %str66.sroa.16.0..sroa_idx, align 1
  %pseudo69 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem70 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo69, i64* nonnull %"@cap_key67", [23 x i8]* nonnull %"@cap_val68", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %45)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %44)
  %47 = bitcast i64* %"@cap_key72" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %47)
  store i64 13, i64* %"@cap_key72", align 8
  %48 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val73", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %48)
  %49 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val73", i64 0, i64 12
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %49, i8 0, i64 11, i1 false)
  store i8 67, i8* %48, align 1
  %str71.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val73", i64 0, i64 1
  store i8 65, i8* %str71.sroa.4.0..sroa_idx, align 1
  %str71.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val73", i64 0, i64 2
  store i8 80, i8* %str71.sroa.5.0..sroa_idx, align 1
  %str71.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val73", i64 0, i64 3
  store i8 95, i8* %str71.sroa.6.0..sroa_idx, align 1
  %str71.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val73", i64 0, i64 4
  store i8 78, i8* %str71.sroa.7.0..sroa_idx, align 1
  %str71.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val73", i64 0, i64 5
  store i8 69, i8* %str71.sroa.8.0..sroa_idx, align 1
  %str71.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val73", i64 0, i64 6
  store i8 84, i8* %str71.sroa.9.0..sroa_idx, align 1
  %str71.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val73", i64 0, i64 7
  store i8 95, i8* %str71.sroa.10.0..sroa_idx, align 1
  %str71.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val73", i64 0, i64 8
  store i8 82, i8* %str71.sroa.11.0..sroa_idx, align 1
  %str71.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val73", i64 0, i64 9
  store i8 65, i8* %str71.sroa.12.0..sroa_idx, align 1
  %str71.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val73", i64 0, i64 10
  store i8 87, i8* %str71.sroa.13.0..sroa_idx, align 1
  %str71.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val73", i64 0, i64 11
  store i8 0, i8* %str71.sroa.14.0..sroa_idx, align 1
  %pseudo74 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem75 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo74, i64* nonnull %"@cap_key72", [23 x i8]* nonnull %"@cap_val73", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %48)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %47)
  %50 = bitcast i64* %"@cap_key77" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %50)
  store i64 14, i64* %"@cap_key77", align 8
  %51 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val78", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %51)
  %52 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val78", i64 0, i64 13
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %52, i8 0, i64 10, i1 false)
  store i8 67, i8* %51, align 1
  %str76.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val78", i64 0, i64 1
  store i8 65, i8* %str76.sroa.4.0..sroa_idx, align 1
  %str76.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val78", i64 0, i64 2
  store i8 80, i8* %str76.sroa.5.0..sroa_idx, align 1
  %str76.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val78", i64 0, i64 3
  store i8 95, i8* %str76.sroa.6.0..sroa_idx, align 1
  %str76.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val78", i64 0, i64 4
  store i8 73, i8* %str76.sroa.7.0..sroa_idx, align 1
  %str76.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val78", i64 0, i64 5
  store i8 80, i8* %str76.sroa.8.0..sroa_idx, align 1
  %str76.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val78", i64 0, i64 6
  store i8 67, i8* %str76.sroa.9.0..sroa_idx, align 1
  %str76.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val78", i64 0, i64 7
  store i8 95, i8* %str76.sroa.10.0..sroa_idx, align 1
  %str76.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val78", i64 0, i64 8
  store i8 76, i8* %str76.sroa.11.0..sroa_idx, align 1
  %str76.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val78", i64 0, i64 9
  store i8 79, i8* %str76.sroa.12.0..sroa_idx, align 1
  %str76.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val78", i64 0, i64 10
  store i8 67, i8* %str76.sroa.13.0..sroa_idx, align 1
  %str76.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val78", i64 0, i64 11
  store i8 75, i8* %str76.sroa.14.0..sroa_idx, align 1
  %str76.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val78", i64 0, i64 12
  store i8 0, i8* %str76.sroa.15.0..sroa_idx, align 1
  %pseudo79 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem80 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo79, i64* nonnull %"@cap_key77", [23 x i8]* nonnull %"@cap_val78", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %51)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %50)
  %53 = bitcast i64* %"@cap_key82" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %53)
  store i64 15, i64* %"@cap_key82", align 8
  %54 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val83", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %54)
  %55 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val83", i64 0, i64 14
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %55, i8 0, i64 9, i1 false)
  store i8 67, i8* %54, align 1
  %str81.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val83", i64 0, i64 1
  store i8 65, i8* %str81.sroa.4.0..sroa_idx, align 1
  %str81.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val83", i64 0, i64 2
  store i8 80, i8* %str81.sroa.5.0..sroa_idx, align 1
  %str81.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val83", i64 0, i64 3
  store i8 95, i8* %str81.sroa.6.0..sroa_idx, align 1
  %str81.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val83", i64 0, i64 4
  store i8 73, i8* %str81.sroa.7.0..sroa_idx, align 1
  %str81.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val83", i64 0, i64 5
  store i8 80, i8* %str81.sroa.8.0..sroa_idx, align 1
  %str81.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val83", i64 0, i64 6
  store i8 67, i8* %str81.sroa.9.0..sroa_idx, align 1
  %str81.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val83", i64 0, i64 7
  store i8 95, i8* %str81.sroa.10.0..sroa_idx, align 1
  %str81.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val83", i64 0, i64 8
  store i8 79, i8* %str81.sroa.11.0..sroa_idx, align 1
  %str81.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val83", i64 0, i64 9
  store i8 87, i8* %str81.sroa.12.0..sroa_idx, align 1
  %str81.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val83", i64 0, i64 10
  store i8 78, i8* %str81.sroa.13.0..sroa_idx, align 1
  %str81.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val83", i64 0, i64 11
  store i8 69, i8* %str81.sroa.14.0..sroa_idx, align 1
  %str81.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val83", i64 0, i64 12
  store i8 82, i8* %str81.sroa.15.0..sroa_idx, align 1
  %str81.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val83", i64 0, i64 13
  store i8 0, i8* %str81.sroa.16.0..sroa_idx, align 1
  %pseudo84 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem85 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo84, i64* nonnull %"@cap_key82", [23 x i8]* nonnull %"@cap_val83", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %54)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %53)
  %56 = bitcast i64* %"@cap_key87" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %56)
  store i64 16, i64* %"@cap_key87", align 8
  %57 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val88", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %57)
  %58 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val88", i64 0, i64 15
  %59 = bitcast i8* %58 to i64*
  store i64 0, i64* %59, align 1
  store i8 67, i8* %57, align 1
  %str86.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val88", i64 0, i64 1
  store i8 65, i8* %str86.sroa.4.0..sroa_idx, align 1
  %str86.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val88", i64 0, i64 2
  store i8 80, i8* %str86.sroa.5.0..sroa_idx, align 1
  %str86.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val88", i64 0, i64 3
  store i8 95, i8* %str86.sroa.6.0..sroa_idx, align 1
  %str86.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val88", i64 0, i64 4
  store i8 83, i8* %str86.sroa.7.0..sroa_idx, align 1
  %str86.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val88", i64 0, i64 5
  store i8 89, i8* %str86.sroa.8.0..sroa_idx, align 1
  %str86.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val88", i64 0, i64 6
  store i8 83, i8* %str86.sroa.9.0..sroa_idx, align 1
  %str86.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val88", i64 0, i64 7
  store i8 95, i8* %str86.sroa.10.0..sroa_idx, align 1
  %str86.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val88", i64 0, i64 8
  store i8 77, i8* %str86.sroa.11.0..sroa_idx, align 1
  %str86.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val88", i64 0, i64 9
  store i8 79, i8* %str86.sroa.12.0..sroa_idx, align 1
  %str86.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val88", i64 0, i64 10
  store i8 68, i8* %str86.sroa.13.0..sroa_idx, align 1
  %str86.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val88", i64 0, i64 11
  store i8 85, i8* %str86.sroa.14.0..sroa_idx, align 1
  %str86.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val88", i64 0, i64 12
  store i8 76, i8* %str86.sroa.15.0..sroa_idx, align 1
  %str86.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val88", i64 0, i64 13
  store i8 69, i8* %str86.sroa.16.0..sroa_idx, align 1
  %str86.sroa.17.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val88", i64 0, i64 14
  store i8 0, i8* %str86.sroa.17.0..sroa_idx, align 1
  %pseudo89 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem90 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo89, i64* nonnull %"@cap_key87", [23 x i8]* nonnull %"@cap_val88", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %57)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %56)
  %60 = bitcast i64* %"@cap_key92" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %60)
  store i64 17, i64* %"@cap_key92", align 8
  %61 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val93", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %61)
  %62 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val93", i64 0, i64 14
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %62, i8 0, i64 9, i1 false)
  store i8 67, i8* %61, align 1
  %str91.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val93", i64 0, i64 1
  store i8 65, i8* %str91.sroa.4.0..sroa_idx, align 1
  %str91.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val93", i64 0, i64 2
  store i8 80, i8* %str91.sroa.5.0..sroa_idx, align 1
  %str91.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val93", i64 0, i64 3
  store i8 95, i8* %str91.sroa.6.0..sroa_idx, align 1
  %str91.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val93", i64 0, i64 4
  store i8 83, i8* %str91.sroa.7.0..sroa_idx, align 1
  %str91.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val93", i64 0, i64 5
  store i8 89, i8* %str91.sroa.8.0..sroa_idx, align 1
  %str91.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val93", i64 0, i64 6
  store i8 83, i8* %str91.sroa.9.0..sroa_idx, align 1
  %str91.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val93", i64 0, i64 7
  store i8 95, i8* %str91.sroa.10.0..sroa_idx, align 1
  %str91.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val93", i64 0, i64 8
  store i8 82, i8* %str91.sroa.11.0..sroa_idx, align 1
  %str91.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val93", i64 0, i64 9
  store i8 65, i8* %str91.sroa.12.0..sroa_idx, align 1
  %str91.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val93", i64 0, i64 10
  store i8 87, i8* %str91.sroa.13.0..sroa_idx, align 1
  %str91.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val93", i64 0, i64 11
  store i8 73, i8* %str91.sroa.14.0..sroa_idx, align 1
  %str91.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val93", i64 0, i64 12
  store i8 79, i8* %str91.sroa.15.0..sroa_idx, align 1
  %str91.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val93", i64 0, i64 13
  store i8 0, i8* %str91.sroa.16.0..sroa_idx, align 1
  %pseudo94 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem95 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo94, i64* nonnull %"@cap_key92", [23 x i8]* nonnull %"@cap_val93", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %61)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %60)
  %63 = bitcast i64* %"@cap_key97" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %63)
  store i64 18, i64* %"@cap_key97", align 8
  %64 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val98", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %64)
  %65 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val98", i64 0, i64 15
  %66 = bitcast i8* %65 to i64*
  store i64 0, i64* %66, align 1
  store i8 67, i8* %64, align 1
  %str96.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val98", i64 0, i64 1
  store i8 65, i8* %str96.sroa.4.0..sroa_idx, align 1
  %str96.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val98", i64 0, i64 2
  store i8 80, i8* %str96.sroa.5.0..sroa_idx, align 1
  %str96.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val98", i64 0, i64 3
  store i8 95, i8* %str96.sroa.6.0..sroa_idx, align 1
  %str96.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val98", i64 0, i64 4
  store i8 83, i8* %str96.sroa.7.0..sroa_idx, align 1
  %str96.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val98", i64 0, i64 5
  store i8 89, i8* %str96.sroa.8.0..sroa_idx, align 1
  %str96.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val98", i64 0, i64 6
  store i8 83, i8* %str96.sroa.9.0..sroa_idx, align 1
  %str96.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val98", i64 0, i64 7
  store i8 95, i8* %str96.sroa.10.0..sroa_idx, align 1
  %str96.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val98", i64 0, i64 8
  store i8 67, i8* %str96.sroa.11.0..sroa_idx, align 1
  %str96.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val98", i64 0, i64 9
  store i8 72, i8* %str96.sroa.12.0..sroa_idx, align 1
  %str96.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val98", i64 0, i64 10
  store i8 82, i8* %str96.sroa.13.0..sroa_idx, align 1
  %str96.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val98", i64 0, i64 11
  store i8 79, i8* %str96.sroa.14.0..sroa_idx, align 1
  %str96.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val98", i64 0, i64 12
  store i8 79, i8* %str96.sroa.15.0..sroa_idx, align 1
  %str96.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val98", i64 0, i64 13
  store i8 84, i8* %str96.sroa.16.0..sroa_idx, align 1
  %str96.sroa.17.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val98", i64 0, i64 14
  store i8 0, i8* %str96.sroa.17.0..sroa_idx, align 1
  %pseudo99 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem100 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo99, i64* nonnull %"@cap_key97", [23 x i8]* nonnull %"@cap_val98", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %64)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %63)
  %67 = bitcast i64* %"@cap_key102" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %67)
  store i64 19, i64* %"@cap_key102", align 8
  %68 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val103", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %68)
  %69 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val103", i64 0, i64 15
  %70 = bitcast i8* %69 to i64*
  store i64 0, i64* %70, align 1
  store i8 67, i8* %68, align 1
  %str101.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val103", i64 0, i64 1
  store i8 65, i8* %str101.sroa.4.0..sroa_idx, align 1
  %str101.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val103", i64 0, i64 2
  store i8 80, i8* %str101.sroa.5.0..sroa_idx, align 1
  %str101.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val103", i64 0, i64 3
  store i8 95, i8* %str101.sroa.6.0..sroa_idx, align 1
  %str101.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val103", i64 0, i64 4
  store i8 83, i8* %str101.sroa.7.0..sroa_idx, align 1
  %str101.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val103", i64 0, i64 5
  store i8 89, i8* %str101.sroa.8.0..sroa_idx, align 1
  %str101.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val103", i64 0, i64 6
  store i8 83, i8* %str101.sroa.9.0..sroa_idx, align 1
  %str101.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val103", i64 0, i64 7
  store i8 95, i8* %str101.sroa.10.0..sroa_idx, align 1
  %str101.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val103", i64 0, i64 8
  store i8 80, i8* %str101.sroa.11.0..sroa_idx, align 1
  %str101.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val103", i64 0, i64 9
  store i8 84, i8* %str101.sroa.12.0..sroa_idx, align 1
  %str101.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val103", i64 0, i64 10
  store i8 82, i8* %str101.sroa.13.0..sroa_idx, align 1
  %str101.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val103", i64 0, i64 11
  store i8 65, i8* %str101.sroa.14.0..sroa_idx, align 1
  %str101.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val103", i64 0, i64 12
  store i8 67, i8* %str101.sroa.15.0..sroa_idx, align 1
  %str101.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val103", i64 0, i64 13
  store i8 69, i8* %str101.sroa.16.0..sroa_idx, align 1
  %str101.sroa.17.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val103", i64 0, i64 14
  store i8 0, i8* %str101.sroa.17.0..sroa_idx, align 1
  %pseudo104 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem105 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo104, i64* nonnull %"@cap_key102", [23 x i8]* nonnull %"@cap_val103", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %68)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %67)
  %71 = bitcast i64* %"@cap_key107" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %71)
  store i64 20, i64* %"@cap_key107", align 8
  %72 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val108", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %72)
  %73 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val108", i64 0, i64 14
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %73, i8 0, i64 9, i1 false)
  store i8 67, i8* %72, align 1
  %str106.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val108", i64 0, i64 1
  store i8 65, i8* %str106.sroa.4.0..sroa_idx, align 1
  %str106.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val108", i64 0, i64 2
  store i8 80, i8* %str106.sroa.5.0..sroa_idx, align 1
  %str106.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val108", i64 0, i64 3
  store i8 95, i8* %str106.sroa.6.0..sroa_idx, align 1
  %str106.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val108", i64 0, i64 4
  store i8 83, i8* %str106.sroa.7.0..sroa_idx, align 1
  %str106.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val108", i64 0, i64 5
  store i8 89, i8* %str106.sroa.8.0..sroa_idx, align 1
  %str106.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val108", i64 0, i64 6
  store i8 83, i8* %str106.sroa.9.0..sroa_idx, align 1
  %str106.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val108", i64 0, i64 7
  store i8 95, i8* %str106.sroa.10.0..sroa_idx, align 1
  %str106.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val108", i64 0, i64 8
  store i8 80, i8* %str106.sroa.11.0..sroa_idx, align 1
  %str106.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val108", i64 0, i64 9
  store i8 65, i8* %str106.sroa.12.0..sroa_idx, align 1
  %str106.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val108", i64 0, i64 10
  store i8 67, i8* %str106.sroa.13.0..sroa_idx, align 1
  %str106.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val108", i64 0, i64 11
  store i8 67, i8* %str106.sroa.14.0..sroa_idx, align 1
  %str106.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val108", i64 0, i64 12
  store i8 84, i8* %str106.sroa.15.0..sroa_idx, align 1
  %str106.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val108", i64 0, i64 13
  store i8 0, i8* %str106.sroa.16.0..sroa_idx, align 1
  %pseudo109 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem110 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo109, i64* nonnull %"@cap_key107", [23 x i8]* nonnull %"@cap_val108", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %72)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %71)
  %74 = bitcast i64* %"@cap_key112" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %74)
  store i64 21, i64* %"@cap_key112", align 8
  %75 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val113", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %75)
  %76 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val113", i64 0, i64 14
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %76, i8 0, i64 9, i1 false)
  store i8 67, i8* %75, align 1
  %str111.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val113", i64 0, i64 1
  store i8 65, i8* %str111.sroa.4.0..sroa_idx, align 1
  %str111.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val113", i64 0, i64 2
  store i8 80, i8* %str111.sroa.5.0..sroa_idx, align 1
  %str111.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val113", i64 0, i64 3
  store i8 95, i8* %str111.sroa.6.0..sroa_idx, align 1
  %str111.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val113", i64 0, i64 4
  store i8 83, i8* %str111.sroa.7.0..sroa_idx, align 1
  %str111.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val113", i64 0, i64 5
  store i8 89, i8* %str111.sroa.8.0..sroa_idx, align 1
  %str111.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val113", i64 0, i64 6
  store i8 83, i8* %str111.sroa.9.0..sroa_idx, align 1
  %str111.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val113", i64 0, i64 7
  store i8 95, i8* %str111.sroa.10.0..sroa_idx, align 1
  %str111.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val113", i64 0, i64 8
  store i8 65, i8* %str111.sroa.11.0..sroa_idx, align 1
  %str111.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val113", i64 0, i64 9
  store i8 68, i8* %str111.sroa.12.0..sroa_idx, align 1
  %str111.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val113", i64 0, i64 10
  store i8 77, i8* %str111.sroa.13.0..sroa_idx, align 1
  %str111.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val113", i64 0, i64 11
  store i8 73, i8* %str111.sroa.14.0..sroa_idx, align 1
  %str111.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val113", i64 0, i64 12
  store i8 78, i8* %str111.sroa.15.0..sroa_idx, align 1
  %str111.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val113", i64 0, i64 13
  store i8 0, i8* %str111.sroa.16.0..sroa_idx, align 1
  %pseudo114 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem115 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo114, i64* nonnull %"@cap_key112", [23 x i8]* nonnull %"@cap_val113", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %75)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %74)
  %77 = bitcast i64* %"@cap_key117" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %77)
  store i64 22, i64* %"@cap_key117", align 8
  %78 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val118", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %78)
  %79 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val118", i64 0, i64 13
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %79, i8 0, i64 10, i1 false)
  store i8 67, i8* %78, align 1
  %str116.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val118", i64 0, i64 1
  store i8 65, i8* %str116.sroa.4.0..sroa_idx, align 1
  %str116.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val118", i64 0, i64 2
  store i8 80, i8* %str116.sroa.5.0..sroa_idx, align 1
  %str116.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val118", i64 0, i64 3
  store i8 95, i8* %str116.sroa.6.0..sroa_idx, align 1
  %str116.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val118", i64 0, i64 4
  store i8 83, i8* %str116.sroa.7.0..sroa_idx, align 1
  %str116.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val118", i64 0, i64 5
  store i8 89, i8* %str116.sroa.8.0..sroa_idx, align 1
  %str116.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val118", i64 0, i64 6
  store i8 83, i8* %str116.sroa.9.0..sroa_idx, align 1
  %str116.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val118", i64 0, i64 7
  store i8 95, i8* %str116.sroa.10.0..sroa_idx, align 1
  %str116.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val118", i64 0, i64 8
  store i8 66, i8* %str116.sroa.11.0..sroa_idx, align 1
  %str116.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val118", i64 0, i64 9
  store i8 79, i8* %str116.sroa.12.0..sroa_idx, align 1
  %str116.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val118", i64 0, i64 10
  store i8 79, i8* %str116.sroa.13.0..sroa_idx, align 1
  %str116.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val118", i64 0, i64 11
  store i8 84, i8* %str116.sroa.14.0..sroa_idx, align 1
  %str116.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val118", i64 0, i64 12
  store i8 0, i8* %str116.sroa.15.0..sroa_idx, align 1
  %pseudo119 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem120 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo119, i64* nonnull %"@cap_key117", [23 x i8]* nonnull %"@cap_val118", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %78)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %77)
  %80 = bitcast i64* %"@cap_key122" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %80)
  store i64 23, i64* %"@cap_key122", align 8
  %81 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val123", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %81)
  %82 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val123", i64 0, i64 13
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %82, i8 0, i64 10, i1 false)
  store i8 67, i8* %81, align 1
  %str121.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val123", i64 0, i64 1
  store i8 65, i8* %str121.sroa.4.0..sroa_idx, align 1
  %str121.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val123", i64 0, i64 2
  store i8 80, i8* %str121.sroa.5.0..sroa_idx, align 1
  %str121.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val123", i64 0, i64 3
  store i8 95, i8* %str121.sroa.6.0..sroa_idx, align 1
  %str121.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val123", i64 0, i64 4
  store i8 83, i8* %str121.sroa.7.0..sroa_idx, align 1
  %str121.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val123", i64 0, i64 5
  store i8 89, i8* %str121.sroa.8.0..sroa_idx, align 1
  %str121.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val123", i64 0, i64 6
  store i8 83, i8* %str121.sroa.9.0..sroa_idx, align 1
  %str121.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val123", i64 0, i64 7
  store i8 95, i8* %str121.sroa.10.0..sroa_idx, align 1
  %str121.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val123", i64 0, i64 8
  store i8 78, i8* %str121.sroa.11.0..sroa_idx, align 1
  %str121.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val123", i64 0, i64 9
  store i8 73, i8* %str121.sroa.12.0..sroa_idx, align 1
  %str121.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val123", i64 0, i64 10
  store i8 67, i8* %str121.sroa.13.0..sroa_idx, align 1
  %str121.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val123", i64 0, i64 11
  store i8 69, i8* %str121.sroa.14.0..sroa_idx, align 1
  %str121.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val123", i64 0, i64 12
  store i8 0, i8* %str121.sroa.15.0..sroa_idx, align 1
  %pseudo124 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem125 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo124, i64* nonnull %"@cap_key122", [23 x i8]* nonnull %"@cap_val123", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %81)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %80)
  %83 = bitcast i64* %"@cap_key127" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %83)
  store i64 24, i64* %"@cap_key127", align 8
  %84 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %84)
  %85 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 17
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %85, i8 0, i64 6, i1 false)
  store i8 67, i8* %84, align 1
  %str126.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 1
  store i8 65, i8* %str126.sroa.4.0..sroa_idx, align 1
  %str126.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 2
  store i8 80, i8* %str126.sroa.5.0..sroa_idx, align 1
  %str126.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 3
  store i8 95, i8* %str126.sroa.6.0..sroa_idx, align 1
  %str126.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 4
  store i8 83, i8* %str126.sroa.7.0..sroa_idx, align 1
  %str126.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 5
  store i8 89, i8* %str126.sroa.8.0..sroa_idx, align 1
  %str126.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 6
  store i8 83, i8* %str126.sroa.9.0..sroa_idx, align 1
  %str126.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 7
  store i8 95, i8* %str126.sroa.10.0..sroa_idx, align 1
  %str126.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 8
  store i8 82, i8* %str126.sroa.11.0..sroa_idx, align 1
  %str126.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 9
  store i8 69, i8* %str126.sroa.12.0..sroa_idx, align 1
  %str126.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 10
  store i8 83, i8* %str126.sroa.13.0..sroa_idx, align 1
  %str126.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 11
  store i8 79, i8* %str126.sroa.14.0..sroa_idx, align 1
  %str126.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 12
  store i8 85, i8* %str126.sroa.15.0..sroa_idx, align 1
  %str126.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 13
  store i8 82, i8* %str126.sroa.16.0..sroa_idx, align 1
  %str126.sroa.17.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 14
  store i8 67, i8* %str126.sroa.17.0..sroa_idx, align 1
  %str126.sroa.18.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 15
  store i8 69, i8* %str126.sroa.18.0..sroa_idx, align 1
  %str126.sroa.19.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val128", i64 0, i64 16
  store i8 0, i8* %str126.sroa.19.0..sroa_idx, align 1
  %pseudo129 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem130 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo129, i64* nonnull %"@cap_key127", [23 x i8]* nonnull %"@cap_val128", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %84)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %83)
  %86 = bitcast i64* %"@cap_key132" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %86)
  store i64 25, i64* %"@cap_key132", align 8
  %87 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val133", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %87)
  %88 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val133", i64 0, i64 13
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %88, i8 0, i64 10, i1 false)
  store i8 67, i8* %87, align 1
  %str131.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val133", i64 0, i64 1
  store i8 65, i8* %str131.sroa.4.0..sroa_idx, align 1
  %str131.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val133", i64 0, i64 2
  store i8 80, i8* %str131.sroa.5.0..sroa_idx, align 1
  %str131.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val133", i64 0, i64 3
  store i8 95, i8* %str131.sroa.6.0..sroa_idx, align 1
  %str131.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val133", i64 0, i64 4
  store i8 83, i8* %str131.sroa.7.0..sroa_idx, align 1
  %str131.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val133", i64 0, i64 5
  store i8 89, i8* %str131.sroa.8.0..sroa_idx, align 1
  %str131.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val133", i64 0, i64 6
  store i8 83, i8* %str131.sroa.9.0..sroa_idx, align 1
  %str131.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val133", i64 0, i64 7
  store i8 95, i8* %str131.sroa.10.0..sroa_idx, align 1
  %str131.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val133", i64 0, i64 8
  store i8 84, i8* %str131.sroa.11.0..sroa_idx, align 1
  %str131.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val133", i64 0, i64 9
  store i8 73, i8* %str131.sroa.12.0..sroa_idx, align 1
  %str131.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val133", i64 0, i64 10
  store i8 77, i8* %str131.sroa.13.0..sroa_idx, align 1
  %str131.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val133", i64 0, i64 11
  store i8 69, i8* %str131.sroa.14.0..sroa_idx, align 1
  %str131.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val133", i64 0, i64 12
  store i8 0, i8* %str131.sroa.15.0..sroa_idx, align 1
  %pseudo134 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem135 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo134, i64* nonnull %"@cap_key132", [23 x i8]* nonnull %"@cap_val133", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %87)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %86)
  %89 = bitcast i64* %"@cap_key137" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %89)
  store i64 26, i64* %"@cap_key137", align 8
  %90 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %90)
  %91 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 19
  %92 = bitcast i8* %91 to i32*
  store i32 0, i32* %92, align 1
  store i8 67, i8* %90, align 1
  %str136.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 1
  store i8 65, i8* %str136.sroa.4.0..sroa_idx, align 1
  %str136.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 2
  store i8 80, i8* %str136.sroa.5.0..sroa_idx, align 1
  %str136.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 3
  store i8 95, i8* %str136.sroa.6.0..sroa_idx, align 1
  %str136.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 4
  store i8 83, i8* %str136.sroa.7.0..sroa_idx, align 1
  %str136.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 5
  store i8 89, i8* %str136.sroa.8.0..sroa_idx, align 1
  %str136.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 6
  store i8 83, i8* %str136.sroa.9.0..sroa_idx, align 1
  %str136.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 7
  store i8 95, i8* %str136.sroa.10.0..sroa_idx, align 1
  %str136.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 8
  store i8 84, i8* %str136.sroa.11.0..sroa_idx, align 1
  %str136.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 9
  store i8 84, i8* %str136.sroa.12.0..sroa_idx, align 1
  %str136.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 10
  store i8 89, i8* %str136.sroa.13.0..sroa_idx, align 1
  %str136.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 11
  store i8 95, i8* %str136.sroa.14.0..sroa_idx, align 1
  %str136.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 12
  store i8 67, i8* %str136.sroa.15.0..sroa_idx, align 1
  %str136.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 13
  store i8 79, i8* %str136.sroa.16.0..sroa_idx, align 1
  %str136.sroa.17.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 14
  store i8 78, i8* %str136.sroa.17.0..sroa_idx, align 1
  %str136.sroa.18.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 15
  store i8 70, i8* %str136.sroa.18.0..sroa_idx, align 1
  %str136.sroa.19.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 16
  store i8 73, i8* %str136.sroa.19.0..sroa_idx, align 1
  %str136.sroa.20.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 17
  store i8 71, i8* %str136.sroa.20.0..sroa_idx, align 1
  %str136.sroa.21.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val138", i64 0, i64 18
  store i8 0, i8* %str136.sroa.21.0..sroa_idx, align 1
  %pseudo139 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem140 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo139, i64* nonnull %"@cap_key137", [23 x i8]* nonnull %"@cap_val138", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %90)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %89)
  %93 = bitcast i64* %"@cap_key142" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %93)
  store i64 27, i64* %"@cap_key142", align 8
  %94 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val143", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %94)
  %95 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val143", i64 0, i64 10
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %95, i8 0, i64 13, i1 false)
  store i8 67, i8* %94, align 1
  %str141.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val143", i64 0, i64 1
  store i8 65, i8* %str141.sroa.4.0..sroa_idx, align 1
  %str141.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val143", i64 0, i64 2
  store i8 80, i8* %str141.sroa.5.0..sroa_idx, align 1
  %str141.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val143", i64 0, i64 3
  store i8 95, i8* %str141.sroa.6.0..sroa_idx, align 1
  %str141.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val143", i64 0, i64 4
  store i8 77, i8* %str141.sroa.7.0..sroa_idx, align 1
  %str141.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val143", i64 0, i64 5
  store i8 75, i8* %str141.sroa.8.0..sroa_idx, align 1
  %str141.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val143", i64 0, i64 6
  store i8 78, i8* %str141.sroa.9.0..sroa_idx, align 1
  %str141.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val143", i64 0, i64 7
  store i8 79, i8* %str141.sroa.10.0..sroa_idx, align 1
  %str141.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val143", i64 0, i64 8
  store i8 68, i8* %str141.sroa.11.0..sroa_idx, align 1
  %str141.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val143", i64 0, i64 9
  store i8 0, i8* %str141.sroa.12.0..sroa_idx, align 1
  %pseudo144 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem145 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo144, i64* nonnull %"@cap_key142", [23 x i8]* nonnull %"@cap_val143", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %94)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %93)
  %96 = bitcast i64* %"@cap_key147" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %96)
  store i64 28, i64* %"@cap_key147", align 8
  %97 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val148", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %97)
  %98 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val148", i64 0, i64 10
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %98, i8 0, i64 13, i1 false)
  store i8 67, i8* %97, align 1
  %str146.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val148", i64 0, i64 1
  store i8 65, i8* %str146.sroa.4.0..sroa_idx, align 1
  %str146.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val148", i64 0, i64 2
  store i8 80, i8* %str146.sroa.5.0..sroa_idx, align 1
  %str146.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val148", i64 0, i64 3
  store i8 95, i8* %str146.sroa.6.0..sroa_idx, align 1
  %str146.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val148", i64 0, i64 4
  store i8 76, i8* %str146.sroa.7.0..sroa_idx, align 1
  %str146.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val148", i64 0, i64 5
  store i8 69, i8* %str146.sroa.8.0..sroa_idx, align 1
  %str146.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val148", i64 0, i64 6
  store i8 65, i8* %str146.sroa.9.0..sroa_idx, align 1
  %str146.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val148", i64 0, i64 7
  store i8 83, i8* %str146.sroa.10.0..sroa_idx, align 1
  %str146.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val148", i64 0, i64 8
  store i8 69, i8* %str146.sroa.11.0..sroa_idx, align 1
  %str146.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val148", i64 0, i64 9
  store i8 0, i8* %str146.sroa.12.0..sroa_idx, align 1
  %pseudo149 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem150 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo149, i64* nonnull %"@cap_key147", [23 x i8]* nonnull %"@cap_val148", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %97)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %96)
  %99 = bitcast i64* %"@cap_key152" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %99)
  store i64 29, i64* %"@cap_key152", align 8
  %100 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %100)
  %101 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 16
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %101, i8 0, i64 7, i1 false)
  store i8 67, i8* %100, align 1
  %str151.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 1
  store i8 65, i8* %str151.sroa.4.0..sroa_idx, align 1
  %str151.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 2
  store i8 80, i8* %str151.sroa.5.0..sroa_idx, align 1
  %str151.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 3
  store i8 95, i8* %str151.sroa.6.0..sroa_idx, align 1
  %str151.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 4
  store i8 65, i8* %str151.sroa.7.0..sroa_idx, align 1
  %str151.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 5
  store i8 85, i8* %str151.sroa.8.0..sroa_idx, align 1
  %str151.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 6
  store i8 68, i8* %str151.sroa.9.0..sroa_idx, align 1
  %str151.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 7
  store i8 73, i8* %str151.sroa.10.0..sroa_idx, align 1
  %str151.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 8
  store i8 84, i8* %str151.sroa.11.0..sroa_idx, align 1
  %str151.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 9
  store i8 95, i8* %str151.sroa.12.0..sroa_idx, align 1
  %str151.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 10
  store i8 87, i8* %str151.sroa.13.0..sroa_idx, align 1
  %str151.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 11
  store i8 82, i8* %str151.sroa.14.0..sroa_idx, align 1
  %str151.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 12
  store i8 73, i8* %str151.sroa.15.0..sroa_idx, align 1
  %str151.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 13
  store i8 84, i8* %str151.sroa.16.0..sroa_idx, align 1
  %str151.sroa.17.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 14
  store i8 69, i8* %str151.sroa.17.0..sroa_idx, align 1
  %str151.sroa.18.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val153", i64 0, i64 15
  store i8 0, i8* %str151.sroa.18.0..sroa_idx, align 1
  %pseudo154 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem155 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo154, i64* nonnull %"@cap_key152", [23 x i8]* nonnull %"@cap_val153", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %100)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %99)
  %102 = bitcast i64* %"@cap_key157" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %102)
  store i64 30, i64* %"@cap_key157", align 8
  %103 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %103)
  %104 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 18
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %104, i8 0, i64 5, i1 false)
  store i8 67, i8* %103, align 1
  %str156.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 1
  store i8 65, i8* %str156.sroa.4.0..sroa_idx, align 1
  %str156.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 2
  store i8 80, i8* %str156.sroa.5.0..sroa_idx, align 1
  %str156.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 3
  store i8 95, i8* %str156.sroa.6.0..sroa_idx, align 1
  %str156.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 4
  store i8 65, i8* %str156.sroa.7.0..sroa_idx, align 1
  %str156.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 5
  store i8 85, i8* %str156.sroa.8.0..sroa_idx, align 1
  %str156.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 6
  store i8 68, i8* %str156.sroa.9.0..sroa_idx, align 1
  %str156.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 7
  store i8 73, i8* %str156.sroa.10.0..sroa_idx, align 1
  %str156.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 8
  store i8 84, i8* %str156.sroa.11.0..sroa_idx, align 1
  %str156.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 9
  store i8 95, i8* %str156.sroa.12.0..sroa_idx, align 1
  %str156.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 10
  store i8 67, i8* %str156.sroa.13.0..sroa_idx, align 1
  %str156.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 11
  store i8 79, i8* %str156.sroa.14.0..sroa_idx, align 1
  %str156.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 12
  store i8 78, i8* %str156.sroa.15.0..sroa_idx, align 1
  %str156.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 13
  store i8 84, i8* %str156.sroa.16.0..sroa_idx, align 1
  %str156.sroa.17.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 14
  store i8 82, i8* %str156.sroa.17.0..sroa_idx, align 1
  %str156.sroa.18.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 15
  store i8 79, i8* %str156.sroa.18.0..sroa_idx, align 1
  %str156.sroa.19.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 16
  store i8 76, i8* %str156.sroa.19.0..sroa_idx, align 1
  %str156.sroa.20.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val158", i64 0, i64 17
  store i8 0, i8* %str156.sroa.20.0..sroa_idx, align 1
  %pseudo159 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem160 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo159, i64* nonnull %"@cap_key157", [23 x i8]* nonnull %"@cap_val158", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %103)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %102)
  %105 = bitcast i64* %"@cap_key162" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %105)
  store i64 31, i64* %"@cap_key162", align 8
  %106 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val163", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %106)
  %107 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val163", i64 0, i64 12
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %107, i8 0, i64 11, i1 false)
  store i8 67, i8* %106, align 1
  %str161.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val163", i64 0, i64 1
  store i8 65, i8* %str161.sroa.4.0..sroa_idx, align 1
  %str161.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val163", i64 0, i64 2
  store i8 80, i8* %str161.sroa.5.0..sroa_idx, align 1
  %str161.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val163", i64 0, i64 3
  store i8 95, i8* %str161.sroa.6.0..sroa_idx, align 1
  %str161.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val163", i64 0, i64 4
  store i8 83, i8* %str161.sroa.7.0..sroa_idx, align 1
  %str161.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val163", i64 0, i64 5
  store i8 69, i8* %str161.sroa.8.0..sroa_idx, align 1
  %str161.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val163", i64 0, i64 6
  store i8 84, i8* %str161.sroa.9.0..sroa_idx, align 1
  %str161.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val163", i64 0, i64 7
  store i8 70, i8* %str161.sroa.10.0..sroa_idx, align 1
  %str161.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val163", i64 0, i64 8
  store i8 67, i8* %str161.sroa.11.0..sroa_idx, align 1
  %str161.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val163", i64 0, i64 9
  store i8 65, i8* %str161.sroa.12.0..sroa_idx, align 1
  %str161.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val163", i64 0, i64 10
  store i8 80, i8* %str161.sroa.13.0..sroa_idx, align 1
  %str161.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val163", i64 0, i64 11
  store i8 0, i8* %str161.sroa.14.0..sroa_idx, align 1
  %pseudo164 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem165 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo164, i64* nonnull %"@cap_key162", [23 x i8]* nonnull %"@cap_val163", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %106)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %105)
  %108 = bitcast i64* %"@cap_key167" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %108)
  store i64 32, i64* %"@cap_key167", align 8
  %109 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %109)
  %110 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 17
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %110, i8 0, i64 6, i1 false)
  store i8 67, i8* %109, align 1
  %str166.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 1
  store i8 65, i8* %str166.sroa.4.0..sroa_idx, align 1
  %str166.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 2
  store i8 80, i8* %str166.sroa.5.0..sroa_idx, align 1
  %str166.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 3
  store i8 95, i8* %str166.sroa.6.0..sroa_idx, align 1
  %str166.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 4
  store i8 77, i8* %str166.sroa.7.0..sroa_idx, align 1
  %str166.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 5
  store i8 65, i8* %str166.sroa.8.0..sroa_idx, align 1
  %str166.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 6
  store i8 67, i8* %str166.sroa.9.0..sroa_idx, align 1
  %str166.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 7
  store i8 95, i8* %str166.sroa.10.0..sroa_idx, align 1
  %str166.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 8
  store i8 79, i8* %str166.sroa.11.0..sroa_idx, align 1
  %str166.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 9
  store i8 86, i8* %str166.sroa.12.0..sroa_idx, align 1
  %str166.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 10
  store i8 69, i8* %str166.sroa.13.0..sroa_idx, align 1
  %str166.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 11
  store i8 82, i8* %str166.sroa.14.0..sroa_idx, align 1
  %str166.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 12
  store i8 82, i8* %str166.sroa.15.0..sroa_idx, align 1
  %str166.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 13
  store i8 73, i8* %str166.sroa.16.0..sroa_idx, align 1
  %str166.sroa.17.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 14
  store i8 68, i8* %str166.sroa.17.0..sroa_idx, align 1
  %str166.sroa.18.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 15
  store i8 69, i8* %str166.sroa.18.0..sroa_idx, align 1
  %str166.sroa.19.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val168", i64 0, i64 16
  store i8 0, i8* %str166.sroa.19.0..sroa_idx, align 1
  %pseudo169 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem170 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo169, i64* nonnull %"@cap_key167", [23 x i8]* nonnull %"@cap_val168", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %109)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %108)
  %111 = bitcast i64* %"@cap_key172" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %111)
  store i64 33, i64* %"@cap_key172", align 8
  %112 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val173", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %112)
  %113 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val173", i64 0, i64 14
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %113, i8 0, i64 9, i1 false)
  store i8 67, i8* %112, align 1
  %str171.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val173", i64 0, i64 1
  store i8 65, i8* %str171.sroa.4.0..sroa_idx, align 1
  %str171.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val173", i64 0, i64 2
  store i8 80, i8* %str171.sroa.5.0..sroa_idx, align 1
  %str171.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val173", i64 0, i64 3
  store i8 95, i8* %str171.sroa.6.0..sroa_idx, align 1
  %str171.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val173", i64 0, i64 4
  store i8 77, i8* %str171.sroa.7.0..sroa_idx, align 1
  %str171.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val173", i64 0, i64 5
  store i8 65, i8* %str171.sroa.8.0..sroa_idx, align 1
  %str171.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val173", i64 0, i64 6
  store i8 67, i8* %str171.sroa.9.0..sroa_idx, align 1
  %str171.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val173", i64 0, i64 7
  store i8 95, i8* %str171.sroa.10.0..sroa_idx, align 1
  %str171.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val173", i64 0, i64 8
  store i8 65, i8* %str171.sroa.11.0..sroa_idx, align 1
  %str171.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val173", i64 0, i64 9
  store i8 68, i8* %str171.sroa.12.0..sroa_idx, align 1
  %str171.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val173", i64 0, i64 10
  store i8 77, i8* %str171.sroa.13.0..sroa_idx, align 1
  %str171.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val173", i64 0, i64 11
  store i8 73, i8* %str171.sroa.14.0..sroa_idx, align 1
  %str171.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val173", i64 0, i64 12
  store i8 78, i8* %str171.sroa.15.0..sroa_idx, align 1
  %str171.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val173", i64 0, i64 13
  store i8 0, i8* %str171.sroa.16.0..sroa_idx, align 1
  %pseudo174 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem175 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo174, i64* nonnull %"@cap_key172", [23 x i8]* nonnull %"@cap_val173", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %112)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %111)
  %114 = bitcast i64* %"@cap_key177" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %114)
  store i64 34, i64* %"@cap_key177", align 8
  %115 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val178", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %115)
  %116 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val178", i64 0, i64 11
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %116, i8 0, i64 12, i1 false)
  store i8 67, i8* %115, align 1
  %str176.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val178", i64 0, i64 1
  store i8 65, i8* %str176.sroa.4.0..sroa_idx, align 1
  %str176.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val178", i64 0, i64 2
  store i8 80, i8* %str176.sroa.5.0..sroa_idx, align 1
  %str176.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val178", i64 0, i64 3
  store i8 95, i8* %str176.sroa.6.0..sroa_idx, align 1
  %str176.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val178", i64 0, i64 4
  store i8 83, i8* %str176.sroa.7.0..sroa_idx, align 1
  %str176.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val178", i64 0, i64 5
  store i8 89, i8* %str176.sroa.8.0..sroa_idx, align 1
  %str176.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val178", i64 0, i64 6
  store i8 83, i8* %str176.sroa.9.0..sroa_idx, align 1
  %str176.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val178", i64 0, i64 7
  store i8 76, i8* %str176.sroa.10.0..sroa_idx, align 1
  %str176.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val178", i64 0, i64 8
  store i8 79, i8* %str176.sroa.11.0..sroa_idx, align 1
  %str176.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val178", i64 0, i64 9
  store i8 71, i8* %str176.sroa.12.0..sroa_idx, align 1
  %str176.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val178", i64 0, i64 10
  store i8 0, i8* %str176.sroa.13.0..sroa_idx, align 1
  %pseudo179 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem180 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo179, i64* nonnull %"@cap_key177", [23 x i8]* nonnull %"@cap_val178", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %115)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %114)
  %117 = bitcast i64* %"@cap_key182" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %117)
  store i64 35, i64* %"@cap_key182", align 8
  %118 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val183", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %118)
  %119 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val183", i64 0, i64 15
  %120 = bitcast i8* %119 to i64*
  store i64 0, i64* %120, align 1
  store i8 67, i8* %118, align 1
  %str181.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val183", i64 0, i64 1
  store i8 65, i8* %str181.sroa.4.0..sroa_idx, align 1
  %str181.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val183", i64 0, i64 2
  store i8 80, i8* %str181.sroa.5.0..sroa_idx, align 1
  %str181.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val183", i64 0, i64 3
  store i8 95, i8* %str181.sroa.6.0..sroa_idx, align 1
  %str181.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val183", i64 0, i64 4
  store i8 87, i8* %str181.sroa.7.0..sroa_idx, align 1
  %str181.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val183", i64 0, i64 5
  store i8 65, i8* %str181.sroa.8.0..sroa_idx, align 1
  %str181.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val183", i64 0, i64 6
  store i8 75, i8* %str181.sroa.9.0..sroa_idx, align 1
  %str181.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val183", i64 0, i64 7
  store i8 69, i8* %str181.sroa.10.0..sroa_idx, align 1
  %str181.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val183", i64 0, i64 8
  store i8 95, i8* %str181.sroa.11.0..sroa_idx, align 1
  %str181.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val183", i64 0, i64 9
  store i8 65, i8* %str181.sroa.12.0..sroa_idx, align 1
  %str181.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val183", i64 0, i64 10
  store i8 76, i8* %str181.sroa.13.0..sroa_idx, align 1
  %str181.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val183", i64 0, i64 11
  store i8 65, i8* %str181.sroa.14.0..sroa_idx, align 1
  %str181.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val183", i64 0, i64 12
  store i8 82, i8* %str181.sroa.15.0..sroa_idx, align 1
  %str181.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val183", i64 0, i64 13
  store i8 77, i8* %str181.sroa.16.0..sroa_idx, align 1
  %str181.sroa.17.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val183", i64 0, i64 14
  store i8 0, i8* %str181.sroa.17.0..sroa_idx, align 1
  %pseudo184 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem185 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo184, i64* nonnull %"@cap_key182", [23 x i8]* nonnull %"@cap_val183", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %118)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %117)
  %121 = bitcast i64* %"@cap_key187" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %121)
  store i64 36, i64* %"@cap_key187", align 8
  %122 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %122)
  %123 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 18
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %123, i8 0, i64 5, i1 false)
  store i8 67, i8* %122, align 1
  %str186.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 1
  store i8 65, i8* %str186.sroa.4.0..sroa_idx, align 1
  %str186.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 2
  store i8 80, i8* %str186.sroa.5.0..sroa_idx, align 1
  %str186.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 3
  store i8 95, i8* %str186.sroa.6.0..sroa_idx, align 1
  %str186.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 4
  store i8 66, i8* %str186.sroa.7.0..sroa_idx, align 1
  %str186.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 5
  store i8 76, i8* %str186.sroa.8.0..sroa_idx, align 1
  %str186.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 6
  store i8 79, i8* %str186.sroa.9.0..sroa_idx, align 1
  %str186.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 7
  store i8 67, i8* %str186.sroa.10.0..sroa_idx, align 1
  %str186.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 8
  store i8 75, i8* %str186.sroa.11.0..sroa_idx, align 1
  %str186.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 9
  store i8 95, i8* %str186.sroa.12.0..sroa_idx, align 1
  %str186.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 10
  store i8 83, i8* %str186.sroa.13.0..sroa_idx, align 1
  %str186.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 11
  store i8 85, i8* %str186.sroa.14.0..sroa_idx, align 1
  %str186.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 12
  store i8 83, i8* %str186.sroa.15.0..sroa_idx, align 1
  %str186.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 13
  store i8 80, i8* %str186.sroa.16.0..sroa_idx, align 1
  %str186.sroa.17.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 14
  store i8 69, i8* %str186.sroa.17.0..sroa_idx, align 1
  %str186.sroa.18.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 15
  store i8 78, i8* %str186.sroa.18.0..sroa_idx, align 1
  %str186.sroa.19.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 16
  store i8 68, i8* %str186.sroa.19.0..sroa_idx, align 1
  %str186.sroa.20.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val188", i64 0, i64 17
  store i8 0, i8* %str186.sroa.20.0..sroa_idx, align 1
  %pseudo189 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem190 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo189, i64* nonnull %"@cap_key187", [23 x i8]* nonnull %"@cap_val188", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %122)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %121)
  %124 = bitcast i64* %"@cap_key192" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %124)
  store i64 37, i64* %"@cap_key192", align 8
  %125 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val193", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %125)
  %126 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val193", i64 0, i64 15
  %127 = bitcast i8* %126 to i64*
  store i64 0, i64* %127, align 1
  store i8 67, i8* %125, align 1
  %str191.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val193", i64 0, i64 1
  store i8 65, i8* %str191.sroa.4.0..sroa_idx, align 1
  %str191.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val193", i64 0, i64 2
  store i8 80, i8* %str191.sroa.5.0..sroa_idx, align 1
  %str191.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val193", i64 0, i64 3
  store i8 95, i8* %str191.sroa.6.0..sroa_idx, align 1
  %str191.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val193", i64 0, i64 4
  store i8 65, i8* %str191.sroa.7.0..sroa_idx, align 1
  %str191.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val193", i64 0, i64 5
  store i8 85, i8* %str191.sroa.8.0..sroa_idx, align 1
  %str191.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val193", i64 0, i64 6
  store i8 68, i8* %str191.sroa.9.0..sroa_idx, align 1
  %str191.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val193", i64 0, i64 7
  store i8 73, i8* %str191.sroa.10.0..sroa_idx, align 1
  %str191.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val193", i64 0, i64 8
  store i8 84, i8* %str191.sroa.11.0..sroa_idx, align 1
  %str191.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val193", i64 0, i64 9
  store i8 95, i8* %str191.sroa.12.0..sroa_idx, align 1
  %str191.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val193", i64 0, i64 10
  store i8 82, i8* %str191.sroa.13.0..sroa_idx, align 1
  %str191.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val193", i64 0, i64 11
  store i8 69, i8* %str191.sroa.14.0..sroa_idx, align 1
  %str191.sroa.15.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val193", i64 0, i64 12
  store i8 65, i8* %str191.sroa.15.0..sroa_idx, align 1
  %str191.sroa.16.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val193", i64 0, i64 13
  store i8 68, i8* %str191.sroa.16.0..sroa_idx, align 1
  %str191.sroa.17.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val193", i64 0, i64 14
  store i8 0, i8* %str191.sroa.17.0..sroa_idx, align 1
  %pseudo194 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem195 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo194, i64* nonnull %"@cap_key192", [23 x i8]* nonnull %"@cap_val193", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %125)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %124)
  %128 = bitcast i64* %"@cap_key197" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %128)
  store i64 38, i64* %"@cap_key197", align 8
  %129 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val198", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %129)
  %130 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val198", i64 0, i64 12
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %130, i8 0, i64 11, i1 false)
  store i8 67, i8* %129, align 1
  %str196.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val198", i64 0, i64 1
  store i8 65, i8* %str196.sroa.4.0..sroa_idx, align 1
  %str196.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val198", i64 0, i64 2
  store i8 80, i8* %str196.sroa.5.0..sroa_idx, align 1
  %str196.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val198", i64 0, i64 3
  store i8 95, i8* %str196.sroa.6.0..sroa_idx, align 1
  %str196.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val198", i64 0, i64 4
  store i8 80, i8* %str196.sroa.7.0..sroa_idx, align 1
  %str196.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val198", i64 0, i64 5
  store i8 69, i8* %str196.sroa.8.0..sroa_idx, align 1
  %str196.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val198", i64 0, i64 6
  store i8 82, i8* %str196.sroa.9.0..sroa_idx, align 1
  %str196.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val198", i64 0, i64 7
  store i8 70, i8* %str196.sroa.10.0..sroa_idx, align 1
  %str196.sroa.11.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val198", i64 0, i64 8
  store i8 77, i8* %str196.sroa.11.0..sroa_idx, align 1
  %str196.sroa.12.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val198", i64 0, i64 9
  store i8 79, i8* %str196.sroa.12.0..sroa_idx, align 1
  %str196.sroa.13.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val198", i64 0, i64 10
  store i8 78, i8* %str196.sroa.13.0..sroa_idx, align 1
  %str196.sroa.14.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val198", i64 0, i64 11
  store i8 0, i8* %str196.sroa.14.0..sroa_idx, align 1
  %pseudo199 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem200 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo199, i64* nonnull %"@cap_key197", [23 x i8]* nonnull %"@cap_val198", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %129)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %128)
  %131 = bitcast i64* %"@cap_key202" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %131)
  store i64 39, i64* %"@cap_key202", align 8
  %132 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val203", i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %132)
  %133 = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val203", i64 0, i64 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %133, i8 0, i64 15, i1 false)
  store i8 67, i8* %132, align 1
  %str201.sroa.4.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val203", i64 0, i64 1
  store i8 65, i8* %str201.sroa.4.0..sroa_idx, align 1
  %str201.sroa.5.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val203", i64 0, i64 2
  store i8 80, i8* %str201.sroa.5.0..sroa_idx, align 1
  %str201.sroa.6.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val203", i64 0, i64 3
  store i8 95, i8* %str201.sroa.6.0..sroa_idx, align 1
  %str201.sroa.7.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val203", i64 0, i64 4
  store i8 66, i8* %str201.sroa.7.0..sroa_idx, align 1
  %str201.sroa.8.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val203", i64 0, i64 5
  store i8 80, i8* %str201.sroa.8.0..sroa_idx, align 1
  %str201.sroa.9.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val203", i64 0, i64 6
  store i8 70, i8* %str201.sroa.9.0..sroa_idx, align 1
  %str201.sroa.10.0..sroa_idx = getelementptr inbounds [23 x i8], [23 x i8]* %"@cap_val203", i64 0, i64 7
  store i8 0, i8* %str201.sroa.10.0..sroa_idx, align 1
  %pseudo204 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem205 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo204, i64* nonnull %"@cap_key202", [23 x i8]* nonnull %"@cap_val203", i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %132)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %131)
  %134 = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %134)
  store i8 67, i8* %134, align 1
  %.fca.1.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 1
  store i8 65, i8* %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 2
  store i8 80, i8* %.fca.2.gep, align 1
  %.fca.3.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 3
  store i8 95, i8* %.fca.3.gep, align 1
  %.fca.4.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 4
  store i8 67, i8* %.fca.4.gep, align 1
  %.fca.5.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 5
  store i8 72, i8* %.fca.5.gep, align 1
  %.fca.6.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 6
  store i8 69, i8* %.fca.6.gep, align 1
  %.fca.7.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 7
  store i8 67, i8* %.fca.7.gep, align 1
  %.fca.8.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 8
  store i8 75, i8* %.fca.8.gep, align 1
  %.fca.9.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 9
  store i8 80, i8* %.fca.9.gep, align 1
  %.fca.10.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 10
  store i8 79, i8* %.fca.10.gep, align 1
  %.fca.11.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 11
  store i8 73, i8* %.fca.11.gep, align 1
  %.fca.12.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 12
  store i8 78, i8* %.fca.12.gep, align 1
  %.fca.13.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 13
  store i8 84, i8* %.fca.13.gep, align 1
  %.fca.14.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 14
  store i8 95, i8* %.fca.14.gep, align 1
  %.fca.15.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 15
  store i8 82, i8* %.fca.15.gep, align 1
  %.fca.16.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 16
  store i8 69, i8* %.fca.16.gep, align 1
  %.fca.17.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 17
  store i8 83, i8* %.fca.17.gep, align 1
  %.fca.18.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 18
  store i8 84, i8* %.fca.18.gep, align 1
  %.fca.19.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 19
  store i8 79, i8* %.fca.19.gep, align 1
  %.fca.20.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 20
  store i8 82, i8* %.fca.20.gep, align 1
  %.fca.21.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 21
  store i8 69, i8* %.fca.21.gep, align 1
  %.fca.22.gep = getelementptr inbounds [23 x i8], [23 x i8]* %str206, i64 0, i64 22
  store i8 0, i8* %.fca.22.gep, align 1
  %135 = bitcast i64* %"@cap_key207" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %135)
  store i64 40, i64* %"@cap_key207", align 8
  %pseudo208 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %update_elem209 = call i64 inttoptr (i64 2 to i64 (i64, i64*, [23 x i8]*, i64)*)(i64 %pseudo208, i64* nonnull %"@cap_key207", [23 x i8]* nonnull %str206, i64 0)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %135)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %134)
  ret i64 0
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg %0, i8* nocapture %1) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly %0, i8 %1, i64 %2, i1 immarg %3) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg %0, i8* nocapture %1) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly %0, i8* noalias nocapture readonly %1, i64 %2, i1 immarg %3) #3

define i64 @"kprobe:cap_capable"(i8* %0) local_unnamed_addr section "s_kprobe:cap_capable_1" {
entry:
  %lookup_elem_val = alloca [23 x i8], align 1
  %"@cap_key" = alloca i64, align 8
  %comm = alloca [16 x i8], align 1
  %printf_args = alloca %printf_t.1, align 8
  %time_t = alloca %time_t, align 8
  %1 = getelementptr i8, i8* %0, i64 96
  %2 = bitcast i8* %1 to i64*
  %arg2 = load volatile i64, i64* %2, align 8
  %3 = getelementptr i8, i8* %0, i64 88
  %4 = bitcast i8* %3 to i64*
  %arg3 = load volatile i64, i64* %4, align 8
  %5 = bitcast %time_t* %time_t to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %5)
  %6 = getelementptr inbounds %time_t, %time_t* %time_t, i64 0, i32 0
  store i64 30004, i64* %6, align 8
  %7 = getelementptr inbounds %time_t, %time_t* %time_t, i64 0, i32 1
  store i32 0, i32* %7, align 8
  %pseudo = tail call i64 @llvm.bpf.pseudo(i64 1, i64 1)
  %perf_event_output = call i64 inttoptr (i64 25 to i64 (i8*, i64, i64, %time_t*, i64)*)(i8* %0, i64 %pseudo, i64 4294967295, %time_t* nonnull %time_t, i64 12)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %5)
  %8 = bitcast %printf_t.1* %printf_args to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %8)
  %9 = getelementptr inbounds %printf_t.1, %printf_t.1* %printf_args, i64 0, i32 5, i64 0
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(80) %9, i8 0, i64 32, i1 false)
  %10 = getelementptr inbounds %printf_t.1, %printf_t.1* %printf_args, i64 0, i32 0
  store i64 2, i64* %10, align 8
  %get_uid_gid = call i64 inttoptr (i64 15 to i64 ()*)()
  %11 = and i64 %get_uid_gid, 4294967295
  %12 = getelementptr inbounds %printf_t.1, %printf_t.1* %printf_args, i64 0, i32 1
  store i64 %11, i64* %12, align 8
  %get_pid_tgid = call i64 inttoptr (i64 14 to i64 ()*)()
  %13 = lshr i64 %get_pid_tgid, 32
  %14 = getelementptr inbounds %printf_t.1, %printf_t.1* %printf_args, i64 0, i32 2
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds [16 x i8], [16 x i8]* %comm, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %15)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(16) %15, i8 0, i64 16, i1 false)
  %get_comm = call i64 inttoptr (i64 16 to i64 ([16 x i8]*, i64)*)([16 x i8]* nonnull %comm, i64 16)
  %16 = getelementptr inbounds %printf_t.1, %printf_t.1* %printf_args, i64 0, i32 3, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %16, i8* noundef nonnull align 1 dereferenceable(16) %15, i64 16, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %15)
  %17 = getelementptr inbounds %printf_t.1, %printf_t.1* %printf_args, i64 0, i32 4
  store i64 %arg2, i64* %17, align 8
  %18 = bitcast i64* %"@cap_key" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %18)
  store i64 %arg2, i64* %"@cap_key", align 8
  %pseudo1 = call i64 @llvm.bpf.pseudo(i64 1, i64 0)
  %lookup_elem = call i8* inttoptr (i64 1 to i8* (i64, i64*)*)(i64 %pseudo1, i64* nonnull %"@cap_key")
  %lookup_elem_val.0.sroa_idx7 = getelementptr inbounds [23 x i8], [23 x i8]* %lookup_elem_val, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 23, i8* nonnull %lookup_elem_val.0.sroa_idx7)
  %map_lookup_cond.not = icmp eq i8* %lookup_elem, null
  br i1 %map_lookup_cond.not, label %lookup_failure, label %lookup_success

lookup_success:                                   ; preds = %entry
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %lookup_elem_val.0.sroa_idx7, i8* noundef nonnull align 1 dereferenceable(23) %lookup_elem, i64 23, i1 false)
  br label %lookup_merge

lookup_failure:                                   ; preds = %entry
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(23) %lookup_elem_val.0.sroa_idx7, i8 0, i64 23, i1 false)
  br label %lookup_merge

lookup_merge:                                     ; preds = %lookup_failure, %lookup_success
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %18)
  %19 = getelementptr inbounds %printf_t.1, %printf_t.1* %printf_args, i64 0, i32 5, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(23) %19, i8* noundef nonnull align 1 dereferenceable(23) %lookup_elem_val.0.sroa_idx7, i64 23, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 23, i8* nonnull %lookup_elem_val.0.sroa_idx7)
  %20 = getelementptr inbounds %printf_t.1, %printf_t.1* %printf_args, i64 0, i32 6
  store i64 %arg3, i64* %20, align 8
  %pseudo2 = call i64 @llvm.bpf.pseudo(i64 1, i64 1)
  %perf_event_output3 = call i64 inttoptr (i64 25 to i64 (i8*, i64, i64, %printf_t.1*, i64)*)(i8* nonnull %0, i64 %pseudo2, i64 4294967295, %printf_t.1* nonnull %printf_args, i64 80)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %8)
  ret i64 0
}

define i64 @END(i8* %0) local_unnamed_addr section "s_END_1" {
entry:
  %"clear_@cap" = alloca %clear_t, align 8
  %1 = bitcast %clear_t* %"clear_@cap" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %1)
  %2 = getelementptr inbounds %clear_t, %clear_t* %"clear_@cap", i64 0, i32 0
  store i64 30002, i64* %2, align 8
  %3 = getelementptr inbounds %clear_t, %clear_t* %"clear_@cap", i64 0, i32 1
  store i32 0, i32* %3, align 8
  %pseudo = tail call i64 @llvm.bpf.pseudo(i64 1, i64 1)
  %perf_event_output = call i64 inttoptr (i64 25 to i64 (i8*, i64, i64, %clear_t*, i64)*)(i8* %0, i64 %pseudo, i64 4294967295, %clear_t* nonnull %"clear_@cap", i64 12)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %1)
  ret i64 0
}

attributes #0 = { nounwind }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
