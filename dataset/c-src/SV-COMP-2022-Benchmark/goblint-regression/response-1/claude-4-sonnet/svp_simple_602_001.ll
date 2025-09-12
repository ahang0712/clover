; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_602_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_602_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@A = global i32 5, align 4, !dbg !0
@B = global i32 5, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() #0 !dbg !15 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !18
  ret void, !dbg !19
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !20 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !23, metadata !DIExpression()), !dbg !24
  %3 = load i32, i32* %2, align 4, !dbg !25
  %4 = icmp ne i32 %3, 0, !dbg !27
  br i1 %4, label %7, label %5, !dbg !28

5:                                                ; preds = %1
  br label %6, !dbg !29

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !30), !dbg !32
  call void @reach_error(), !dbg !33
  call void @abort() #4, !dbg !35
  unreachable, !dbg !35

7:                                                ; preds = %1
  ret void, !dbg !36
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @generate(i8* %0) #0 !dbg !37 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %4, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 1, i32* %4, align 4, !dbg !45
  br label %5, !dbg !47

5:                                                ; preds = %11, %1
  %6 = load i32, i32* %4, align 4, !dbg !48
  %7 = icmp slt i32 %6, 100, !dbg !50
  br i1 %7, label %8, label %14, !dbg !51

8:                                                ; preds = %5
  %9 = load i32, i32* %4, align 4, !dbg !52
  store i32 %9, i32* @A, align 4, !dbg !54
  store i32 5, i32* @A, align 4, !dbg !55
  %10 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 1), !dbg !56
  br label %11, !dbg !57

11:                                               ; preds = %8
  %12 = load i32, i32* %4, align 4, !dbg !58
  %13 = add nsw i32 %12, 1, !dbg !58
  store i32 %13, i32* %4, align 4, !dbg !58
  br label %5, !dbg !59, !llvm.loop !60

14:                                               ; preds = %5
  %15 = load i8*, i8** %2, align 8, !dbg !62
  ret i8* %15, !dbg !62
}

declare i32 @sleep(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @process(i8* %0) #0 !dbg !63 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !64, metadata !DIExpression()), !dbg !65
  br label %3, !dbg !66

3:                                                ; preds = %1, %16
  %4 = load i32, i32* @A, align 4, !dbg !67
  %5 = icmp sgt i32 %4, 0, !dbg !70
  br i1 %5, label %6, label %14, !dbg !71

6:                                                ; preds = %3
  %7 = load i32, i32* @A, align 4, !dbg !72
  %8 = add nsw i32 %7, 1, !dbg !72
  store i32 %8, i32* @A, align 4, !dbg !72
  %9 = load i32, i32* @A, align 4, !dbg !74
  store i32 %9, i32* @B, align 4, !dbg !75
  %10 = load i32, i32* @B, align 4, !dbg !76
  %11 = add nsw i32 %10, -1, !dbg !76
  store i32 %11, i32* @B, align 4, !dbg !76
  %12 = load i32, i32* @A, align 4, !dbg !77
  %13 = add nsw i32 %12, -1, !dbg !77
  store i32 %13, i32* @A, align 4, !dbg !77
  br label %16, !dbg !78

14:                                               ; preds = %3
  %15 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 2), !dbg !79
  br label %16

16:                                               ; preds = %14, %6
  br label %3, !dbg !66, !llvm.loop !80
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @dispose(i8* %0) #0 !dbg !82 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32* %3, metadata !85, metadata !DIExpression()), !dbg !86
  br label %4, !dbg !87

4:                                                ; preds = %1, %14
  %5 = load i32, i32* @B, align 4, !dbg !88
  %6 = icmp sgt i32 %5, 0, !dbg !91
  br i1 %6, label %7, label %12, !dbg !92

7:                                                ; preds = %4
  %8 = load i32, i32* @B, align 4, !dbg !93
  store i32 %8, i32* %3, align 4, !dbg !95
  %9 = load i32, i32* %3, align 4, !dbg !96
  %10 = icmp eq i32 %9, 5, !dbg !97
  %11 = zext i1 %10 to i32, !dbg !97
  call void @__VERIFIER_assert(i32 %11), !dbg !98
  br label %14, !dbg !99

12:                                               ; preds = %4
  %13 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 5), !dbg !100
  br label %14

14:                                               ; preds = %12, %7
  br label %4, !dbg !87, !llvm.loop !101
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_602_001_main() #0 !dbg !103 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !106, metadata !DIExpression()), !dbg !107
  store i32 0, i32* %1, align 4, !dbg !108
  br label %2, !dbg !110

2:                                                ; preds = %11, %0
  %3 = load i32, i32* %1, align 4, !dbg !111
  %4 = icmp slt i32 %3, 10, !dbg !113
  br i1 %4, label %5, label %14, !dbg !114

5:                                                ; preds = %2
  %6 = load i32, i32* @A, align 4, !dbg !115
  %7 = load i32, i32* @B, align 4, !dbg !117
  %8 = icmp eq i32 %6, %7, !dbg !118
  %9 = zext i1 %8 to i32, !dbg !118
  call void @__VERIFIER_assert(i32 %9), !dbg !119
  %10 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 3), !dbg !120
  br label %11, !dbg !121

11:                                               ; preds = %5
  %12 = load i32, i32* %1, align 4, !dbg !122
  %13 = add nsw i32 %12, 1, !dbg !122
  store i32 %13, i32* %1, align 4, !dbg !122
  br label %2, !dbg !123, !llvm.loop !124

14:                                               ; preds = %2
  ret i32 0, !dbg !126
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "A", scope: !2, file: !8, line: 6, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_602_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "B", scope: !2, file: !8, line: 7, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_602_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{!"clang version 10.0.0 "}
!15 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !16, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocation(line: 2, column: 22, scope: !15)
!19 = !DILocation(line: 2, column: 33, scope: !15)
!20 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 3, type: !21, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !9}
!23 = !DILocalVariable(name: "cond", arg: 1, scope: !20, file: !8, line: 3, type: !9)
!24 = !DILocation(line: 3, column: 28, scope: !20)
!25 = !DILocation(line: 3, column: 41, scope: !26)
!26 = distinct !DILexicalBlock(scope: !20, file: !8, line: 3, column: 39)
!27 = !DILocation(line: 3, column: 40, scope: !26)
!28 = !DILocation(line: 3, column: 39, scope: !20)
!29 = !DILocation(line: 3, column: 48, scope: !26)
!30 = !DILabel(scope: !31, name: "ERROR", file: !8, line: 3)
!31 = distinct !DILexicalBlock(scope: !26, file: !8, line: 3, column: 48)
!32 = !DILocation(line: 3, column: 50, scope: !31)
!33 = !DILocation(line: 3, column: 58, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !8, line: 3, column: 57)
!35 = !DILocation(line: 3, column: 72, scope: !34)
!36 = !DILocation(line: 3, column: 84, scope: !20)
!37 = distinct !DISubprogram(name: "generate", scope: !8, file: !8, line: 10, type: !38, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!38 = !DISubroutineType(types: !39)
!39 = !{!40, !40}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!41 = !DILocalVariable(name: "arg", arg: 1, scope: !37, file: !8, line: 10, type: !40)
!42 = !DILocation(line: 10, column: 22, scope: !37)
!43 = !DILocalVariable(name: "i", scope: !37, file: !8, line: 11, type: !9)
!44 = !DILocation(line: 11, column: 7, scope: !37)
!45 = !DILocation(line: 12, column: 9, scope: !46)
!46 = distinct !DILexicalBlock(scope: !37, file: !8, line: 12, column: 3)
!47 = !DILocation(line: 12, column: 8, scope: !46)
!48 = !DILocation(line: 12, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !8, line: 12, column: 3)
!50 = !DILocation(line: 12, column: 14, scope: !49)
!51 = !DILocation(line: 12, column: 3, scope: !46)
!52 = !DILocation(line: 14, column: 9, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !8, line: 12, column: 25)
!54 = !DILocation(line: 14, column: 7, scope: !53)
!55 = !DILocation(line: 15, column: 7, scope: !53)
!56 = !DILocation(line: 17, column: 5, scope: !53)
!57 = !DILocation(line: 18, column: 3, scope: !53)
!58 = !DILocation(line: 12, column: 21, scope: !49)
!59 = !DILocation(line: 12, column: 3, scope: !49)
!60 = distinct !{!60, !51, !61}
!61 = !DILocation(line: 18, column: 3, scope: !46)
!62 = !DILocation(line: 19, column: 1, scope: !37)
!63 = distinct !DISubprogram(name: "process", scope: !8, file: !8, line: 21, type: !38, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocalVariable(name: "arg", arg: 1, scope: !63, file: !8, line: 21, type: !40)
!65 = !DILocation(line: 21, column: 21, scope: !63)
!66 = !DILocation(line: 22, column: 3, scope: !63)
!67 = !DILocation(line: 24, column: 9, scope: !68)
!68 = distinct !DILexicalBlock(scope: !69, file: !8, line: 24, column: 9)
!69 = distinct !DILexicalBlock(scope: !63, file: !8, line: 22, column: 13)
!70 = !DILocation(line: 24, column: 11, scope: !68)
!71 = !DILocation(line: 24, column: 9, scope: !69)
!72 = !DILocation(line: 25, column: 8, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !8, line: 24, column: 16)
!74 = !DILocation(line: 26, column: 11, scope: !73)
!75 = !DILocation(line: 26, column: 9, scope: !73)
!76 = !DILocation(line: 27, column: 8, scope: !73)
!77 = !DILocation(line: 28, column: 8, scope: !73)
!78 = !DILocation(line: 29, column: 5, scope: !73)
!79 = !DILocation(line: 31, column: 5, scope: !68)
!80 = distinct !{!80, !66, !81}
!81 = !DILocation(line: 32, column: 3, scope: !63)
!82 = distinct !DISubprogram(name: "dispose", scope: !8, file: !8, line: 35, type: !38, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocalVariable(name: "arg", arg: 1, scope: !82, file: !8, line: 35, type: !40)
!84 = !DILocation(line: 35, column: 21, scope: !82)
!85 = !DILocalVariable(name: "p", scope: !82, file: !8, line: 36, type: !9)
!86 = !DILocation(line: 36, column: 7, scope: !82)
!87 = !DILocation(line: 37, column: 3, scope: !82)
!88 = !DILocation(line: 38, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !90, file: !8, line: 38, column: 9)
!90 = distinct !DILexicalBlock(scope: !82, file: !8, line: 37, column: 13)
!91 = !DILocation(line: 38, column: 11, scope: !89)
!92 = !DILocation(line: 38, column: 9, scope: !90)
!93 = !DILocation(line: 39, column: 11, scope: !94)
!94 = distinct !DILexicalBlock(scope: !89, file: !8, line: 38, column: 16)
!95 = !DILocation(line: 39, column: 9, scope: !94)
!96 = !DILocation(line: 40, column: 25, scope: !94)
!97 = !DILocation(line: 40, column: 27, scope: !94)
!98 = !DILocation(line: 40, column: 7, scope: !94)
!99 = !DILocation(line: 41, column: 5, scope: !94)
!100 = !DILocation(line: 43, column: 5, scope: !89)
!101 = distinct !{!101, !87, !102}
!102 = !DILocation(line: 44, column: 3, scope: !82)
!103 = distinct !DISubprogram(name: "svp_simple_602_001_main", scope: !8, file: !8, line: 47, type: !104, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DISubroutineType(types: !105)
!105 = !{!9}
!106 = !DILocalVariable(name: "i", scope: !103, file: !8, line: 48, type: !9)
!107 = !DILocation(line: 48, column: 7, scope: !103)
!108 = !DILocation(line: 50, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !103, file: !8, line: 50, column: 3)
!110 = !DILocation(line: 50, column: 8, scope: !109)
!111 = !DILocation(line: 50, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !8, line: 50, column: 3)
!113 = !DILocation(line: 50, column: 14, scope: !112)
!114 = !DILocation(line: 50, column: 3, scope: !109)
!115 = !DILocation(line: 53, column: 23, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !8, line: 50, column: 24)
!117 = !DILocation(line: 53, column: 28, scope: !116)
!118 = !DILocation(line: 53, column: 25, scope: !116)
!119 = !DILocation(line: 53, column: 5, scope: !116)
!120 = !DILocation(line: 57, column: 5, scope: !116)
!121 = !DILocation(line: 58, column: 3, scope: !116)
!122 = !DILocation(line: 50, column: 20, scope: !112)
!123 = !DILocation(line: 50, column: 3, scope: !112)
!124 = distinct !{!124, !114, !125}
!125 = !DILocation(line: 58, column: 3, scope: !109)
!126 = !DILocation(line: 59, column: 3, scope: !103)
