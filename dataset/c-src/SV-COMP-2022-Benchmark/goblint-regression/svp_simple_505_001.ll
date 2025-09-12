; ModuleID = 'svp_simple_505_001.c'
source_filename = "svp_simple_505_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@myglobal = common global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @isr_fun() #0 !dbg !12 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !15, metadata !DIExpression()), !dbg !16
  %3 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !17
  store i32 %3, i32* %1, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata i32* %2, metadata !18, metadata !DIExpression()), !dbg !19
  %4 = load i32, i32* @myglobal, align 4, !dbg !20
  %5 = add nsw i32 %4, 1, !dbg !21
  store i32 %5, i32* %2, align 4, !dbg !19
  %6 = load i32, i32* %2, align 4, !dbg !22
  store i32 %6, i32* @myglobal, align 4, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @__VERIFIER_nondet_int(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_505_001_isr_1(i8* %0) #0 !dbg !25 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %3, metadata !31, metadata !DIExpression()), !dbg !32
  %4 = load i32, i32* @myglobal, align 4, !dbg !33
  %5 = add nsw i32 %4, 1, !dbg !34
  store i32 %5, i32* %3, align 4, !dbg !32
  %6 = load i32, i32* %3, align 4, !dbg !35
  store i32 %6, i32* @myglobal, align 4, !dbg !36
  call void @isr_fun(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_505_001_main() #0 !dbg !39 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !42, metadata !DIExpression()), !dbg !43
  %2 = load i32, i32* @myglobal, align 4, !dbg !44
  %3 = add nsw i32 %2, 1, !dbg !45
  store i32 %3, i32* %1, align 4, !dbg !43
  %4 = load i32, i32* %1, align 4, !dbg !46
  store i32 %4, i32* @myglobal, align 4, !dbg !47
  ret i32 0, !dbg !48
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "myglobal", scope: !2, file: !3, line: 4, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_505_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{!"clang version 10.0.0 "}
!12 = distinct !DISubprogram(name: "isr_fun", scope: !3, file: !3, line: 7, type: !13, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !12, file: !3, line: 8, type: !6)
!16 = !DILocation(line: 8, column: 7, scope: !12)
!17 = !DILocation(line: 8, column: 11, scope: !12)
!18 = !DILocalVariable(name: "tmp", scope: !12, file: !3, line: 9, type: !6)
!19 = !DILocation(line: 9, column: 7, scope: !12)
!20 = !DILocation(line: 9, column: 13, scope: !12)
!21 = !DILocation(line: 9, column: 21, scope: !12)
!22 = !DILocation(line: 10, column: 12, scope: !12)
!23 = !DILocation(line: 10, column: 11, scope: !12)
!24 = !DILocation(line: 12, column: 1, scope: !12)
!25 = distinct !DISubprogram(name: "svp_simple_505_001_isr_1", scope: !3, file: !3, line: 14, type: !26, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !28}
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!29 = !DILocalVariable(name: "arg", arg: 1, scope: !25, file: !3, line: 14, type: !28)
!30 = !DILocation(line: 14, column: 37, scope: !25)
!31 = !DILocalVariable(name: "tmp", scope: !25, file: !3, line: 17, type: !6)
!32 = !DILocation(line: 17, column: 7, scope: !25)
!33 = !DILocation(line: 17, column: 13, scope: !25)
!34 = !DILocation(line: 17, column: 21, scope: !25)
!35 = !DILocation(line: 18, column: 12, scope: !25)
!36 = !DILocation(line: 18, column: 11, scope: !25)
!37 = !DILocation(line: 20, column: 3, scope: !25)
!38 = !DILocation(line: 22, column: 1, scope: !25)
!39 = distinct !DISubprogram(name: "svp_simple_505_001_main", scope: !3, file: !3, line: 24, type: !40, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DISubroutineType(types: !41)
!41 = !{!6}
!42 = !DILocalVariable(name: "tmp", scope: !39, file: !3, line: 27, type: !6)
!43 = !DILocation(line: 27, column: 7, scope: !39)
!44 = !DILocation(line: 27, column: 13, scope: !39)
!45 = !DILocation(line: 27, column: 21, scope: !39)
!46 = !DILocation(line: 28, column: 12, scope: !39)
!47 = !DILocation(line: 28, column: 11, scope: !39)
!48 = !DILocation(line: 31, column: 3, scope: !39)
