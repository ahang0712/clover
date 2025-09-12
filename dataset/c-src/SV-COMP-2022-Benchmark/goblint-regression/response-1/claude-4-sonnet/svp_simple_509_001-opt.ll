; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/claude-4-sonnet/svp_simple_509_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_509_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@myglobal = common local_unnamed_addr global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @munge() local_unnamed_addr #0 !dbg !13 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !16, metadata !DIExpression()), !dbg !17
  %2 = load i32, i32* @myglobal, align 4, !dbg !18
  %3 = add nsw i32 %2, 1, !dbg !19
  store i32 %3, i32* %1, align 4, !dbg !17
  %4 = load i32, i32* %1, align 4, !dbg !20
  store i32 %4, i32* @myglobal, align 4, !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @isr_munge() local_unnamed_addr #0 !dbg !23 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = load i32, i32* @myglobal, align 4, !dbg !26
  %3 = add nsw i32 %2, 1, !dbg !27
  store i32 %3, i32* %1, align 4, !dbg !25
  %4 = load i32, i32* %1, align 4, !dbg !28
  store i32 %4, i32* @myglobal, align 4, !dbg !29
  ret void, !dbg !30
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_509_001_isr_1(i8* %0) local_unnamed_addr #0 !dbg !31 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !35, metadata !DIExpression()), !dbg !36
  call void @isr_munge(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_509_001_main() local_unnamed_addr #0 !dbg !39 {
  call void @munge(), !dbg !42
  ret i32 0, !dbg !43
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "myglobal", scope: !2, file: !6, line: 3, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_509_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_509_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{!"clang version 10.0.0 "}
!13 = distinct !DISubprogram(name: "munge", scope: !6, file: !6, line: 6, type: !14, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "tmp", scope: !13, file: !6, line: 7, type: !7)
!17 = !DILocation(line: 7, column: 7, scope: !13)
!18 = !DILocation(line: 7, column: 13, scope: !13)
!19 = !DILocation(line: 7, column: 21, scope: !13)
!20 = !DILocation(line: 8, column: 12, scope: !13)
!21 = !DILocation(line: 8, column: 11, scope: !13)
!22 = !DILocation(line: 11, column: 1, scope: !13)
!23 = distinct !DISubprogram(name: "isr_munge", scope: !6, file: !6, line: 12, type: !14, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DILocalVariable(name: "tmp", scope: !23, file: !6, line: 13, type: !7)
!25 = !DILocation(line: 13, column: 7, scope: !23)
!26 = !DILocation(line: 13, column: 13, scope: !23)
!27 = !DILocation(line: 13, column: 21, scope: !23)
!28 = !DILocation(line: 14, column: 12, scope: !23)
!29 = !DILocation(line: 14, column: 11, scope: !23)
!30 = !DILocation(line: 17, column: 1, scope: !23)
!31 = distinct !DISubprogram(name: "svp_simple_509_001_isr_1", scope: !6, file: !6, line: 19, type: !32, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!32 = !DISubroutineType(types: !33)
!33 = !{null, !34}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!35 = !DILocalVariable(name: "arg", arg: 1, scope: !31, file: !6, line: 19, type: !34)
!36 = !DILocation(line: 19, column: 37, scope: !31)
!37 = !DILocation(line: 20, column: 3, scope: !31)
!38 = !DILocation(line: 22, column: 1, scope: !31)
!39 = distinct !DISubprogram(name: "svp_simple_509_001_main", scope: !6, file: !6, line: 25, type: !40, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DISubroutineType(types: !41)
!41 = !{!7}
!42 = !DILocation(line: 27, column: 3, scope: !39)
!43 = !DILocation(line: 28, column: 3, scope: !39)
