; ModuleID = '/seahorn/sea-dsa/lib/seadsa/SpecLang.cc'
source_filename = "/seahorn/sea-dsa/lib/seadsa/SpecLang.cc"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 !dbg !8 {
  %1 = tail call noalias i8* @sea_dsa_new(), !dbg !16
  call void @llvm.dbg.value(metadata i8* %1, metadata !14, metadata !DIExpression()), !dbg !17
  tail call void @sea_dsa_collapse(i8* noundef %1), !dbg !18
  tail call void @sea_dsa_set_heap(i8* noundef %1), !dbg !19
  tail call void @sea_dsa_set_read(i8* noundef %1), !dbg !20
  tail call void @sea_dsa_set_modified(i8* noundef %1), !dbg !21
  tail call void @sea_dsa_set_ptrtoint(i8* noundef %1), !dbg !22
  tail call void @sea_dsa_set_inttoptr(i8* noundef %1), !dbg !23
  tail call void @sea_dsa_set_external(i8* noundef %1), !dbg !24
  tail call void (i8*, ...) @sea_dsa_alias(i8* noundef %1), !dbg !25
  tail call void @sea_dsa_link(i8* noundef %1, i32 noundef 0, i8* noundef %1), !dbg !26
  tail call void @sea_dsa_access(i8* noundef %1, i32 noundef 0), !dbg !27
  %2 = tail call i8* @sea_dsa_mk(), !dbg !28
  ret i32 0, !dbg !29
}

declare !dbg !30 noalias i8* @sea_dsa_new() local_unnamed_addr #1

declare !dbg !35 void @sea_dsa_collapse(i8* noundef) local_unnamed_addr #1

declare !dbg !40 void @sea_dsa_set_heap(i8* noundef) local_unnamed_addr #1

declare !dbg !41 void @sea_dsa_set_read(i8* noundef) local_unnamed_addr #1

declare !dbg !42 void @sea_dsa_set_modified(i8* noundef) local_unnamed_addr #1

declare !dbg !43 void @sea_dsa_set_ptrtoint(i8* noundef) local_unnamed_addr #1

declare !dbg !44 void @sea_dsa_set_inttoptr(i8* noundef) local_unnamed_addr #1

declare !dbg !45 void @sea_dsa_set_external(i8* noundef) local_unnamed_addr #1

declare !dbg !46 void @sea_dsa_alias(i8* noundef, ...) local_unnamed_addr #1

declare !dbg !49 void @sea_dsa_link(i8* noundef, i32 noundef, i8* noundef) local_unnamed_addr #1

declare !dbg !53 void @sea_dsa_access(i8* noundef, i32 noundef) local_unnamed_addr #1

declare !dbg !56 i8* @sea_dsa_mk() local_unnamed_addr #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

attributes #0 = { mustprogress norecurse uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/seahorn/sea-dsa/lib/seadsa/SpecLang.cc", directory: "/seahorn/build", checksumkind: CSK_MD5, checksum: "3edd84428c1dd29f28fc3b59f94871f6")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!8 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 3, type: !10, scopeLine: 3, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !13)
!9 = !DIFile(filename: "sea-dsa/lib/seadsa/SpecLang.cc", directory: "/seahorn", checksumkind: CSK_MD5, checksum: "3edd84428c1dd29f28fc3b59f94871f6")
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{!14}
!14 = !DILocalVariable(name: "p", scope: !8, file: !9, line: 4, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DILocation(line: 4, column: 13, scope: !8)
!17 = !DILocation(line: 0, scope: !8)
!18 = !DILocation(line: 5, column: 3, scope: !8)
!19 = !DILocation(line: 6, column: 3, scope: !8)
!20 = !DILocation(line: 7, column: 3, scope: !8)
!21 = !DILocation(line: 8, column: 3, scope: !8)
!22 = !DILocation(line: 9, column: 3, scope: !8)
!23 = !DILocation(line: 10, column: 3, scope: !8)
!24 = !DILocation(line: 11, column: 3, scope: !8)
!25 = !DILocation(line: 12, column: 3, scope: !8)
!26 = !DILocation(line: 13, column: 3, scope: !8)
!27 = !DILocation(line: 14, column: 3, scope: !8)
!28 = !DILocation(line: 15, column: 3, scope: !8)
!29 = !DILocation(line: 16, column: 3, scope: !8)
!30 = !DISubprogram(name: "sea_dsa_new", scope: !31, file: !31, line: 29, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !34)
!31 = !DIFile(filename: "sea-dsa/include/seadsa/sea_dsa.h", directory: "/seahorn", checksumkind: CSK_MD5, checksum: "634d00eb47bed8cbdb489db4384b0505")
!32 = !DISubroutineType(types: !33)
!33 = !{!15}
!34 = !{}
!35 = !DISubprogram(name: "sea_dsa_collapse", scope: !31, file: !31, line: 27, type: !36, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !34)
!36 = !DISubroutineType(types: !37)
!37 = !{null, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!40 = !DISubprogram(name: "sea_dsa_set_heap", scope: !31, file: !31, line: 23, type: !36, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !34)
!41 = !DISubprogram(name: "sea_dsa_set_read", scope: !31, file: !31, line: 13, type: !36, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !34)
!42 = !DISubprogram(name: "sea_dsa_set_modified", scope: !31, file: !31, line: 15, type: !36, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !34)
!43 = !DISubprogram(name: "sea_dsa_set_ptrtoint", scope: !31, file: !31, line: 19, type: !36, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !34)
!44 = !DISubprogram(name: "sea_dsa_set_inttoptr", scope: !31, file: !31, line: 21, type: !36, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !34)
!45 = !DISubprogram(name: "sea_dsa_set_external", scope: !31, file: !31, line: 25, type: !36, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !34)
!46 = !DISubprogram(name: "sea_dsa_alias", scope: !31, file: !31, line: 11, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !34)
!47 = !DISubroutineType(types: !48)
!48 = !{null, !38, null}
!49 = !DISubprogram(name: "sea_dsa_link", scope: !31, file: !31, line: 36, type: !50, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !34)
!50 = !DISubroutineType(types: !51)
!51 = !{null, !38, !52, !38}
!52 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!53 = !DISubprogram(name: "sea_dsa_access", scope: !31, file: !31, line: 40, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !34)
!54 = !DISubroutineType(types: !55)
!55 = !{null, !38, !52}
!56 = !DISubprogram(name: "sea_dsa_mk", scope: !31, file: !31, line: 32, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !34)
