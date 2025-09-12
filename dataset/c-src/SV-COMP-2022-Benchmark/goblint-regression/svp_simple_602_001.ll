; ModuleID = 'svp_simple_602_001.c'
source_filename = "svp_simple_602_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@A = global i32 5, align 4, !dbg !0
@B = global i32 5, align 4, !dbg !6

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
define i8* @generate(i8* %0) #0 !dbg !36 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i32* %4, metadata !42, metadata !DIExpression()), !dbg !43
  store i32 1, i32* %4, align 4, !dbg !44
  br label %5, !dbg !46

5:                                                ; preds = %11, %1
  %6 = load i32, i32* %4, align 4, !dbg !47
  %7 = icmp slt i32 %6, 100, !dbg !49
  br i1 %7, label %8, label %14, !dbg !50

8:                                                ; preds = %5
  %9 = load i32, i32* %4, align 4, !dbg !51
  store i32 %9, i32* @A, align 4, !dbg !53
  store i32 5, i32* @A, align 4, !dbg !54
  %10 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 1), !dbg !55
  br label %11, !dbg !56

11:                                               ; preds = %8
  %12 = load i32, i32* %4, align 4, !dbg !57
  %13 = add nsw i32 %12, 1, !dbg !57
  store i32 %13, i32* %4, align 4, !dbg !57
  br label %5, !dbg !58, !llvm.loop !59

14:                                               ; preds = %5
  %15 = load i8*, i8** %2, align 8, !dbg !61
  ret i8* %15, !dbg !61
}

declare i32 @sleep(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @process(i8* %0) #0 !dbg !62 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !63, metadata !DIExpression()), !dbg !64
  br label %3, !dbg !65

3:                                                ; preds = %1, %16
  %4 = load i32, i32* @A, align 4, !dbg !66
  %5 = icmp sgt i32 %4, 0, !dbg !69
  br i1 %5, label %6, label %14, !dbg !70

6:                                                ; preds = %3
  %7 = load i32, i32* @A, align 4, !dbg !71
  %8 = add nsw i32 %7, 1, !dbg !71
  store i32 %8, i32* @A, align 4, !dbg !71
  %9 = load i32, i32* @A, align 4, !dbg !73
  store i32 %9, i32* @B, align 4, !dbg !74
  %10 = load i32, i32* @B, align 4, !dbg !75
  %11 = add nsw i32 %10, -1, !dbg !75
  store i32 %11, i32* @B, align 4, !dbg !75
  %12 = load i32, i32* @A, align 4, !dbg !76
  %13 = add nsw i32 %12, -1, !dbg !76
  store i32 %13, i32* @A, align 4, !dbg !76
  br label %16, !dbg !77

14:                                               ; preds = %3
  %15 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 2), !dbg !78
  br label %16

16:                                               ; preds = %14, %6
  br label %3, !dbg !65, !llvm.loop !79
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @dispose(i8* %0) #0 !dbg !81 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32* %3, metadata !84, metadata !DIExpression()), !dbg !85
  br label %4, !dbg !86

4:                                                ; preds = %1, %14
  %5 = load i32, i32* @B, align 4, !dbg !87
  %6 = icmp sgt i32 %5, 0, !dbg !90
  br i1 %6, label %7, label %12, !dbg !91

7:                                                ; preds = %4
  %8 = load i32, i32* @B, align 4, !dbg !92
  store i32 %8, i32* %3, align 4, !dbg !94
  %9 = load i32, i32* %3, align 4, !dbg !95
  %10 = icmp eq i32 %9, 5, !dbg !96
  %11 = zext i1 %10 to i32, !dbg !96
  call void @__VERIFIER_assert(i32 %11), !dbg !97
  br label %14, !dbg !98

12:                                               ; preds = %4
  %13 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 5), !dbg !99
  br label %14

14:                                               ; preds = %12, %7
  br label %4, !dbg !86, !llvm.loop !100
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_602_001_main() #0 !dbg !102 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 0, i32* %1, align 4, !dbg !107
  br label %2, !dbg !109

2:                                                ; preds = %11, %0
  %3 = load i32, i32* %1, align 4, !dbg !110
  %4 = icmp slt i32 %3, 10, !dbg !112
  br i1 %4, label %5, label %14, !dbg !113

5:                                                ; preds = %2
  %6 = load i32, i32* @A, align 4, !dbg !114
  %7 = load i32, i32* @B, align 4, !dbg !116
  %8 = icmp eq i32 %6, %7, !dbg !117
  %9 = zext i1 %8 to i32, !dbg !117
  call void @__VERIFIER_assert(i32 %9), !dbg !118
  %10 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 3), !dbg !119
  br label %11, !dbg !120

11:                                               ; preds = %5
  %12 = load i32, i32* %1, align 4, !dbg !121
  %13 = add nsw i32 %12, 1, !dbg !121
  store i32 %13, i32* %1, align 4, !dbg !121
  br label %2, !dbg !122, !llvm.loop !123

14:                                               ; preds = %2
  ret i32 0, !dbg !125
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
!1 = distinct !DIGlobalVariable(name: "A", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_602_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "B", scope: !2, file: !3, line: 7, type: !8, isLocal: false, isDefinition: true)
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
!36 = distinct !DISubprogram(name: "generate", scope: !3, file: !3, line: 10, type: !37, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DISubroutineType(types: !38)
!38 = !{!39, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!40 = !DILocalVariable(name: "arg", arg: 1, scope: !36, file: !3, line: 10, type: !39)
!41 = !DILocation(line: 10, column: 22, scope: !36)
!42 = !DILocalVariable(name: "i", scope: !36, file: !3, line: 11, type: !8)
!43 = !DILocation(line: 11, column: 7, scope: !36)
!44 = !DILocation(line: 12, column: 9, scope: !45)
!45 = distinct !DILexicalBlock(scope: !36, file: !3, line: 12, column: 3)
!46 = !DILocation(line: 12, column: 8, scope: !45)
!47 = !DILocation(line: 12, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !3, line: 12, column: 3)
!49 = !DILocation(line: 12, column: 14, scope: !48)
!50 = !DILocation(line: 12, column: 3, scope: !45)
!51 = !DILocation(line: 14, column: 9, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !3, line: 12, column: 25)
!53 = !DILocation(line: 14, column: 7, scope: !52)
!54 = !DILocation(line: 15, column: 7, scope: !52)
!55 = !DILocation(line: 17, column: 5, scope: !52)
!56 = !DILocation(line: 18, column: 3, scope: !52)
!57 = !DILocation(line: 12, column: 21, scope: !48)
!58 = !DILocation(line: 12, column: 3, scope: !48)
!59 = distinct !{!59, !50, !60}
!60 = !DILocation(line: 18, column: 3, scope: !45)
!61 = !DILocation(line: 19, column: 1, scope: !36)
!62 = distinct !DISubprogram(name: "process", scope: !3, file: !3, line: 21, type: !37, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DILocalVariable(name: "arg", arg: 1, scope: !62, file: !3, line: 21, type: !39)
!64 = !DILocation(line: 21, column: 21, scope: !62)
!65 = !DILocation(line: 22, column: 3, scope: !62)
!66 = !DILocation(line: 24, column: 9, scope: !67)
!67 = distinct !DILexicalBlock(scope: !68, file: !3, line: 24, column: 9)
!68 = distinct !DILexicalBlock(scope: !62, file: !3, line: 22, column: 13)
!69 = !DILocation(line: 24, column: 11, scope: !67)
!70 = !DILocation(line: 24, column: 9, scope: !68)
!71 = !DILocation(line: 25, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !3, line: 24, column: 16)
!73 = !DILocation(line: 26, column: 11, scope: !72)
!74 = !DILocation(line: 26, column: 9, scope: !72)
!75 = !DILocation(line: 27, column: 8, scope: !72)
!76 = !DILocation(line: 28, column: 8, scope: !72)
!77 = !DILocation(line: 29, column: 5, scope: !72)
!78 = !DILocation(line: 31, column: 5, scope: !67)
!79 = distinct !{!79, !65, !80}
!80 = !DILocation(line: 32, column: 3, scope: !62)
!81 = distinct !DISubprogram(name: "dispose", scope: !3, file: !3, line: 35, type: !37, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "arg", arg: 1, scope: !81, file: !3, line: 35, type: !39)
!83 = !DILocation(line: 35, column: 21, scope: !81)
!84 = !DILocalVariable(name: "p", scope: !81, file: !3, line: 36, type: !8)
!85 = !DILocation(line: 36, column: 7, scope: !81)
!86 = !DILocation(line: 37, column: 3, scope: !81)
!87 = !DILocation(line: 38, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !89, file: !3, line: 38, column: 9)
!89 = distinct !DILexicalBlock(scope: !81, file: !3, line: 37, column: 13)
!90 = !DILocation(line: 38, column: 11, scope: !88)
!91 = !DILocation(line: 38, column: 9, scope: !89)
!92 = !DILocation(line: 39, column: 11, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !3, line: 38, column: 16)
!94 = !DILocation(line: 39, column: 9, scope: !93)
!95 = !DILocation(line: 40, column: 25, scope: !93)
!96 = !DILocation(line: 40, column: 27, scope: !93)
!97 = !DILocation(line: 40, column: 7, scope: !93)
!98 = !DILocation(line: 41, column: 5, scope: !93)
!99 = !DILocation(line: 43, column: 5, scope: !88)
!100 = distinct !{!100, !86, !101}
!101 = !DILocation(line: 44, column: 3, scope: !81)
!102 = distinct !DISubprogram(name: "svp_simple_602_001_main", scope: !3, file: !3, line: 47, type: !103, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DISubroutineType(types: !104)
!104 = !{!8}
!105 = !DILocalVariable(name: "i", scope: !102, file: !3, line: 48, type: !8)
!106 = !DILocation(line: 48, column: 7, scope: !102)
!107 = !DILocation(line: 50, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !102, file: !3, line: 50, column: 3)
!109 = !DILocation(line: 50, column: 8, scope: !108)
!110 = !DILocation(line: 50, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !3, line: 50, column: 3)
!112 = !DILocation(line: 50, column: 14, scope: !111)
!113 = !DILocation(line: 50, column: 3, scope: !108)
!114 = !DILocation(line: 53, column: 23, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !3, line: 50, column: 24)
!116 = !DILocation(line: 53, column: 28, scope: !115)
!117 = !DILocation(line: 53, column: 25, scope: !115)
!118 = !DILocation(line: 53, column: 5, scope: !115)
!119 = !DILocation(line: 57, column: 5, scope: !115)
!120 = !DILocation(line: 58, column: 3, scope: !115)
!121 = !DILocation(line: 50, column: 20, scope: !111)
!122 = !DILocation(line: 50, column: 3, scope: !111)
!123 = distinct !{!123, !113, !124}
!124 = !DILocation(line: 58, column: 3, scope: !108)
!125 = !DILocation(line: 59, column: 3, scope: !102)
