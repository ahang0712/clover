; ModuleID = 'svp_simple_510_001.c'
source_filename = "svp_simple_510_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@myglobal = common global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @munge() #0 !dbg !12 {
  %1 = load i32, i32* @myglobal, align 4, !dbg !15
  %2 = add nsw i32 %1, 1, !dbg !16
  store i32 %2, i32* @myglobal, align 4, !dbg !17
  ret void, !dbg !18
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_510_001_isr_1(i8* %0) #0 !dbg !19 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !23, metadata !DIExpression()), !dbg !24
  call void @munge(), !dbg !25
  ret void, !dbg !26
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_510_001_main() #0 !dbg !27 {
  call void @munge(), !dbg !30
  ret i32 0, !dbg !31
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "myglobal", scope: !2, file: !3, line: 3, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_510_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
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
!15 = !DILocation(line: 8, column: 12, scope: !12)
!16 = !DILocation(line: 8, column: 20, scope: !12)
!17 = !DILocation(line: 8, column: 11, scope: !12)
!18 = !DILocation(line: 10, column: 1, scope: !12)
!19 = distinct !DISubprogram(name: "svp_simple_510_001_isr_1", scope: !3, file: !3, line: 12, type: !20, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !22}
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!23 = !DILocalVariable(name: "arg", arg: 1, scope: !19, file: !3, line: 12, type: !22)
!24 = !DILocation(line: 12, column: 37, scope: !19)
!25 = !DILocation(line: 13, column: 3, scope: !19)
!26 = !DILocation(line: 15, column: 1, scope: !19)
!27 = distinct !DISubprogram(name: "svp_simple_510_001_main", scope: !3, file: !3, line: 18, type: !28, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!28 = !DISubroutineType(types: !29)
!29 = !{!6}
!30 = !DILocation(line: 20, column: 3, scope: !27)
!31 = !DILocation(line: 22, column: 3, scope: !27)
