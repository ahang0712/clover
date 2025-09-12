; ModuleID = 'svp_simple_616_001.c'
source_filename = "svp_simple_616_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g1 = common global i32 0, align 4, !dbg !0
@g2 = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() #0 !dbg !14 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !17
  ret void, !dbg !18
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !19 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !22, metadata !DIExpression()), !dbg !23
  %3 = load i32, i32* %2, align 4, !dbg !24
  %4 = icmp ne i32 %3, 0, !dbg !26
  br i1 %4, label %7, label %5, !dbg !27

5:                                                ; preds = %1
  br label %6, !dbg !28

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !29), !dbg !31
  call void @reach_error(), !dbg !32
  call void @abort() #4, !dbg !34
  unreachable, !dbg !34

7:                                                ; preds = %1
  ret void, !dbg !35
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_616_001_isr_1(i8* %0) #0 !dbg !36 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i32* %3, metadata !42, metadata !DIExpression()), !dbg !43
  %5 = load i32, i32* @g1, align 4, !dbg !44
  %6 = add nsw i32 %5, 1, !dbg !45
  store i32 %6, i32* %3, align 4, !dbg !43
  %7 = load i32, i32* %3, align 4, !dbg !46
  store i32 %7, i32* @g1, align 4, !dbg !47
  call void @llvm.dbg.declare(metadata i32* %4, metadata !48, metadata !DIExpression()), !dbg !49
  %8 = load i32, i32* @g1, align 4, !dbg !50
  %9 = sub nsw i32 %8, 1, !dbg !51
  store i32 %9, i32* %4, align 4, !dbg !49
  %10 = load i32, i32* %4, align 4, !dbg !52
  store i32 %10, i32* @g1, align 4, !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_616_001_isr_2(i8* %0) #0 !dbg !55 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i32* %3, metadata !58, metadata !DIExpression()), !dbg !59
  %5 = load i32, i32* @g2, align 4, !dbg !60
  %6 = add nsw i32 %5, 1, !dbg !61
  store i32 %6, i32* %3, align 4, !dbg !59
  %7 = load i32, i32* %3, align 4, !dbg !62
  store i32 %7, i32* @g2, align 4, !dbg !63
  call void @llvm.dbg.declare(metadata i32* %4, metadata !64, metadata !DIExpression()), !dbg !65
  %8 = load i32, i32* @g2, align 4, !dbg !66
  %9 = sub nsw i32 %8, 1, !dbg !67
  store i32 %9, i32* %4, align 4, !dbg !65
  %10 = load i32, i32* %4, align 4, !dbg !68
  store i32 %10, i32* @g2, align 4, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_616_001_main() #0 !dbg !71 {
  %1 = load i32, i32* @g1, align 4, !dbg !74
  %2 = icmp eq i32 %1, 0, !dbg !75
  %3 = zext i1 %2 to i32, !dbg !75
  call void @__VERIFIER_assert(i32 %3), !dbg !76
  %4 = load i32, i32* @g1, align 4, !dbg !77
  %5 = icmp eq i32 %4, 0, !dbg !78
  %6 = zext i1 %5 to i32, !dbg !78
  call void @__VERIFIER_assert(i32 %6), !dbg !79
  %7 = load i32, i32* @g2, align 4, !dbg !80
  %8 = icmp eq i32 %7, 0, !dbg !81
  %9 = zext i1 %8 to i32, !dbg !81
  call void @__VERIFIER_assert(i32 %9), !dbg !82
  %10 = load i32, i32* @g1, align 4, !dbg !83
  %11 = icmp eq i32 %10, 0, !dbg !84
  %12 = zext i1 %11 to i32, !dbg !84
  call void @__VERIFIER_assert(i32 %12), !dbg !85
  ret i32 0, !dbg !86
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g1", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_616_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "g2", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "reach_error", scope: !3, file: !3, line: 2, type: !15, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocation(line: 2, column: 22, scope: !14)
!18 = !DILocation(line: 2, column: 33, scope: !14)
!19 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !3, file: !3, line: 3, type: !20, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !8}
!22 = !DILocalVariable(name: "cond", arg: 1, scope: !19, file: !3, line: 3, type: !8)
!23 = !DILocation(line: 3, column: 28, scope: !19)
!24 = !DILocation(line: 3, column: 41, scope: !25)
!25 = distinct !DILexicalBlock(scope: !19, file: !3, line: 3, column: 39)
!26 = !DILocation(line: 3, column: 40, scope: !25)
!27 = !DILocation(line: 3, column: 39, scope: !19)
!28 = !DILocation(line: 3, column: 48, scope: !25)
!29 = !DILabel(scope: !30, name: "ERROR", file: !3, line: 3)
!30 = distinct !DILexicalBlock(scope: !25, file: !3, line: 3, column: 48)
!31 = !DILocation(line: 3, column: 50, scope: !30)
!32 = !DILocation(line: 3, column: 58, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !3, line: 3, column: 57)
!34 = !DILocation(line: 3, column: 72, scope: !33)
!35 = !DILocation(line: 3, column: 84, scope: !19)
!36 = distinct !DISubprogram(name: "svp_simple_616_001_isr_1", scope: !3, file: !3, line: 8, type: !37, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!40 = !DILocalVariable(name: "arg", arg: 1, scope: !36, file: !3, line: 8, type: !39)
!41 = !DILocation(line: 8, column: 37, scope: !36)
!42 = !DILocalVariable(name: "tmp1", scope: !36, file: !3, line: 10, type: !8)
!43 = !DILocation(line: 10, column: 7, scope: !36)
!44 = !DILocation(line: 10, column: 14, scope: !36)
!45 = !DILocation(line: 10, column: 17, scope: !36)
!46 = !DILocation(line: 11, column: 8, scope: !36)
!47 = !DILocation(line: 11, column: 6, scope: !36)
!48 = !DILocalVariable(name: "tmp2", scope: !36, file: !3, line: 14, type: !8)
!49 = !DILocation(line: 14, column: 7, scope: !36)
!50 = !DILocation(line: 14, column: 14, scope: !36)
!51 = !DILocation(line: 14, column: 17, scope: !36)
!52 = !DILocation(line: 15, column: 8, scope: !36)
!53 = !DILocation(line: 15, column: 6, scope: !36)
!54 = !DILocation(line: 17, column: 1, scope: !36)
!55 = distinct !DISubprogram(name: "svp_simple_616_001_isr_2", scope: !3, file: !3, line: 19, type: !37, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocalVariable(name: "arg", arg: 1, scope: !55, file: !3, line: 19, type: !39)
!57 = !DILocation(line: 19, column: 37, scope: !55)
!58 = !DILocalVariable(name: "tmp3", scope: !55, file: !3, line: 21, type: !8)
!59 = !DILocation(line: 21, column: 7, scope: !55)
!60 = !DILocation(line: 21, column: 14, scope: !55)
!61 = !DILocation(line: 21, column: 17, scope: !55)
!62 = !DILocation(line: 22, column: 8, scope: !55)
!63 = !DILocation(line: 22, column: 6, scope: !55)
!64 = !DILocalVariable(name: "tmp4", scope: !55, file: !3, line: 25, type: !8)
!65 = !DILocation(line: 25, column: 7, scope: !55)
!66 = !DILocation(line: 25, column: 14, scope: !55)
!67 = !DILocation(line: 25, column: 17, scope: !55)
!68 = !DILocation(line: 26, column: 8, scope: !55)
!69 = !DILocation(line: 26, column: 6, scope: !55)
!70 = !DILocation(line: 28, column: 1, scope: !55)
!71 = distinct !DISubprogram(name: "svp_simple_616_001_main", scope: !3, file: !3, line: 30, type: !72, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DISubroutineType(types: !73)
!73 = !{!8}
!74 = !DILocation(line: 31, column: 21, scope: !71)
!75 = !DILocation(line: 31, column: 24, scope: !71)
!76 = !DILocation(line: 31, column: 3, scope: !71)
!77 = !DILocation(line: 33, column: 21, scope: !71)
!78 = !DILocation(line: 33, column: 24, scope: !71)
!79 = !DILocation(line: 33, column: 3, scope: !71)
!80 = !DILocation(line: 35, column: 21, scope: !71)
!81 = !DILocation(line: 35, column: 24, scope: !71)
!82 = !DILocation(line: 35, column: 3, scope: !71)
!83 = !DILocation(line: 37, column: 21, scope: !71)
!84 = !DILocation(line: 37, column: 24, scope: !71)
!85 = !DILocation(line: 37, column: 3, scope: !71)
!86 = !DILocation(line: 39, column: 3, scope: !71)
