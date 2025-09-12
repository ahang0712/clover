; ModuleID = 'svp_simple_509_001.c'
source_filename = "svp_simple_509_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@myglobal = common global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @munge() #0 !dbg !12 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !15, metadata !DIExpression()), !dbg !16
  %2 = load i32, i32* @myglobal, align 4, !dbg !17
  %3 = add nsw i32 %2, 1, !dbg !18
  store i32 %3, i32* %1, align 4, !dbg !16
  %4 = load i32, i32* %1, align 4, !dbg !19
  store i32 %4, i32* @myglobal, align 4, !dbg !20
  ret void, !dbg !21
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @isr_munge() #0 !dbg !22 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = load i32, i32* @myglobal, align 4, !dbg !25
  %3 = add nsw i32 %2, 1, !dbg !26
  store i32 %3, i32* %1, align 4, !dbg !24
  %4 = load i32, i32* %1, align 4, !dbg !27
  store i32 %4, i32* @myglobal, align 4, !dbg !28
  ret void, !dbg !29
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_509_001_isr_1(i8* %0) #0 !dbg !30 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !34, metadata !DIExpression()), !dbg !35
  call void @isr_munge(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_509_001_main() #0 !dbg !38 {
  call void @munge(), !dbg !41
  ret i32 0, !dbg !42
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "myglobal", scope: !2, file: !3, line: 3, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_509_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{!"clang version 10.0.0 "}
!12 = distinct !DISubprogram(name: "munge", scope: !3, file: !3, line: 6, type: !13, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "tmp", scope: !12, file: !3, line: 7, type: !6)
!16 = !DILocation(line: 7, column: 7, scope: !12)
!17 = !DILocation(line: 7, column: 13, scope: !12)
!18 = !DILocation(line: 7, column: 21, scope: !12)
!19 = !DILocation(line: 8, column: 12, scope: !12)
!20 = !DILocation(line: 8, column: 11, scope: !12)
!21 = !DILocation(line: 11, column: 1, scope: !12)
!22 = distinct !DISubprogram(name: "isr_munge", scope: !3, file: !3, line: 12, type: !13, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DILocalVariable(name: "tmp", scope: !22, file: !3, line: 13, type: !6)
!24 = !DILocation(line: 13, column: 7, scope: !22)
!25 = !DILocation(line: 13, column: 13, scope: !22)
!26 = !DILocation(line: 13, column: 21, scope: !22)
!27 = !DILocation(line: 14, column: 12, scope: !22)
!28 = !DILocation(line: 14, column: 11, scope: !22)
!29 = !DILocation(line: 17, column: 1, scope: !22)
!30 = distinct !DISubprogram(name: "svp_simple_509_001_isr_1", scope: !3, file: !3, line: 19, type: !31, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!34 = !DILocalVariable(name: "arg", arg: 1, scope: !30, file: !3, line: 19, type: !33)
!35 = !DILocation(line: 19, column: 37, scope: !30)
!36 = !DILocation(line: 20, column: 3, scope: !30)
!37 = !DILocation(line: 22, column: 1, scope: !30)
!38 = distinct !DISubprogram(name: "svp_simple_509_001_main", scope: !3, file: !3, line: 25, type: !39, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DISubroutineType(types: !40)
!40 = !{!6}
!41 = !DILocation(line: 27, column: 3, scope: !38)
!42 = !DILocation(line: 28, column: 3, scope: !38)
