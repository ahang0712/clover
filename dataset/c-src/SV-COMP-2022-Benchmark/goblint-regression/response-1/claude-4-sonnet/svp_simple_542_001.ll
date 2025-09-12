; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_542_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_542_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@myglobal = common global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @f(i32 %0) #0 !dbg !13 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !16, metadata !DIExpression()), !dbg !17
  ret i32 5, !dbg !18
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_542_001_isr_1(i8* %0) #0 !dbg !19 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !23, metadata !DIExpression()), !dbg !24
  %4 = load i32, i32* @myglobal, align 4, !dbg !25
  %5 = call i32 @f(i32 %4), !dbg !26
  store i32 %5, i32* @myglobal, align 4, !dbg !27
  %6 = load i32, i32* @myglobal, align 4, !dbg !28
  %7 = icmp eq i32 %6, 5, !dbg !30
  br i1 %7, label %8, label %9, !dbg !31

8:                                                ; preds = %1
  call void @llvm.dbg.declare(metadata i32* %3, metadata !32, metadata !DIExpression()), !dbg !34
  store i32 1, i32* %3, align 4, !dbg !34
  br label %9, !dbg !35

9:                                                ; preds = %8, %1
  ret void, !dbg !36
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_542_001_main() #0 !dbg !37 {
  %1 = load i32, i32* @myglobal, align 4, !dbg !40
  %2 = call i32 @f(i32 %1), !dbg !41
  store i32 %2, i32* @myglobal, align 4, !dbg !42
  %3 = load i32, i32* @myglobal, align 4, !dbg !43
  %4 = call i32 @f(i32 %3), !dbg !44
  store i32 %4, i32* @myglobal, align 4, !dbg !45
  ret i32 0, !dbg !46
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "myglobal", scope: !2, file: !6, line: 2, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_542_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_542_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{!"clang version 10.0.0 "}
!13 = distinct !DISubprogram(name: "f", scope: !6, file: !6, line: 4, type: !14, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{!7, !7}
!16 = !DILocalVariable(name: "x", arg: 1, scope: !13, file: !6, line: 4, type: !7)
!17 = !DILocation(line: 4, column: 11, scope: !13)
!18 = !DILocation(line: 5, column: 3, scope: !13)
!19 = distinct !DISubprogram(name: "svp_simple_542_001_isr_1", scope: !6, file: !6, line: 7, type: !20, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !22}
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!23 = !DILocalVariable(name: "arg", arg: 1, scope: !19, file: !6, line: 7, type: !22)
!24 = !DILocation(line: 7, column: 37, scope: !19)
!25 = !DILocation(line: 8, column: 16, scope: !19)
!26 = !DILocation(line: 8, column: 14, scope: !19)
!27 = !DILocation(line: 8, column: 13, scope: !19)
!28 = !DILocation(line: 9, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !19, file: !6, line: 9, column: 8)
!30 = !DILocation(line: 9, column: 17, scope: !29)
!31 = !DILocation(line: 9, column: 8, scope: !19)
!32 = !DILocalVariable(name: "tmp", scope: !33, file: !6, line: 10, type: !7)
!33 = distinct !DILexicalBlock(scope: !29, file: !6, line: 9, column: 22)
!34 = !DILocation(line: 10, column: 15, scope: !33)
!35 = !DILocation(line: 11, column: 5, scope: !33)
!36 = !DILocation(line: 12, column: 1, scope: !19)
!37 = distinct !DISubprogram(name: "svp_simple_542_001_main", scope: !6, file: !6, line: 14, type: !38, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!38 = !DISubroutineType(types: !39)
!39 = !{!7}
!40 = !DILocation(line: 18, column: 16, scope: !37)
!41 = !DILocation(line: 18, column: 14, scope: !37)
!42 = !DILocation(line: 18, column: 12, scope: !37)
!43 = !DILocation(line: 19, column: 16, scope: !37)
!44 = !DILocation(line: 19, column: 14, scope: !37)
!45 = !DILocation(line: 19, column: 12, scope: !37)
!46 = !DILocation(line: 20, column: 3, scope: !37)
