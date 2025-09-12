; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_505_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_505_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@myglobal = common global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @isr_fun() #0 !dbg !13 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !16, metadata !DIExpression()), !dbg !17
  %3 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !18
  store i32 %3, i32* %1, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %2, metadata !19, metadata !DIExpression()), !dbg !20
  %4 = load i32, i32* @myglobal, align 4, !dbg !21
  %5 = add nsw i32 %4, 1, !dbg !22
  store i32 %5, i32* %2, align 4, !dbg !20
  %6 = load i32, i32* %2, align 4, !dbg !23
  store i32 %6, i32* @myglobal, align 4, !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @__VERIFIER_nondet_int(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_505_001_isr_1(i8* %0) #0 !dbg !26 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i32* %3, metadata !32, metadata !DIExpression()), !dbg !33
  %4 = load i32, i32* @myglobal, align 4, !dbg !34
  %5 = add nsw i32 %4, 1, !dbg !35
  store i32 %5, i32* %3, align 4, !dbg !33
  %6 = load i32, i32* %3, align 4, !dbg !36
  store i32 %6, i32* @myglobal, align 4, !dbg !37
  call void @isr_fun(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_505_001_main() #0 !dbg !40 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !43, metadata !DIExpression()), !dbg !44
  %2 = load i32, i32* @myglobal, align 4, !dbg !45
  %3 = add nsw i32 %2, 1, !dbg !46
  store i32 %3, i32* %1, align 4, !dbg !44
  %4 = load i32, i32* %1, align 4, !dbg !47
  store i32 %4, i32* @myglobal, align 4, !dbg !48
  ret i32 0, !dbg !49
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "myglobal", scope: !2, file: !6, line: 4, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_505_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_505_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{!"clang version 10.0.0 "}
!13 = distinct !DISubprogram(name: "isr_fun", scope: !6, file: !6, line: 7, type: !14, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "i", scope: !13, file: !6, line: 8, type: !7)
!17 = !DILocation(line: 8, column: 7, scope: !13)
!18 = !DILocation(line: 8, column: 11, scope: !13)
!19 = !DILocalVariable(name: "tmp", scope: !13, file: !6, line: 9, type: !7)
!20 = !DILocation(line: 9, column: 7, scope: !13)
!21 = !DILocation(line: 9, column: 13, scope: !13)
!22 = !DILocation(line: 9, column: 21, scope: !13)
!23 = !DILocation(line: 10, column: 12, scope: !13)
!24 = !DILocation(line: 10, column: 11, scope: !13)
!25 = !DILocation(line: 12, column: 1, scope: !13)
!26 = distinct !DISubprogram(name: "svp_simple_505_001_isr_1", scope: !6, file: !6, line: 14, type: !27, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !29}
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!30 = !DILocalVariable(name: "arg", arg: 1, scope: !26, file: !6, line: 14, type: !29)
!31 = !DILocation(line: 14, column: 37, scope: !26)
!32 = !DILocalVariable(name: "tmp", scope: !26, file: !6, line: 17, type: !7)
!33 = !DILocation(line: 17, column: 7, scope: !26)
!34 = !DILocation(line: 17, column: 13, scope: !26)
!35 = !DILocation(line: 17, column: 21, scope: !26)
!36 = !DILocation(line: 18, column: 12, scope: !26)
!37 = !DILocation(line: 18, column: 11, scope: !26)
!38 = !DILocation(line: 20, column: 3, scope: !26)
!39 = !DILocation(line: 22, column: 1, scope: !26)
!40 = distinct !DISubprogram(name: "svp_simple_505_001_main", scope: !6, file: !6, line: 24, type: !41, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DISubroutineType(types: !42)
!42 = !{!7}
!43 = !DILocalVariable(name: "tmp", scope: !40, file: !6, line: 27, type: !7)
!44 = !DILocation(line: 27, column: 7, scope: !40)
!45 = !DILocation(line: 27, column: 13, scope: !40)
!46 = !DILocation(line: 27, column: 21, scope: !40)
!47 = !DILocation(line: 28, column: 12, scope: !40)
!48 = !DILocation(line: 28, column: 11, scope: !40)
!49 = !DILocation(line: 31, column: 3, scope: !40)
