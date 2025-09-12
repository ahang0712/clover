; ModuleID = 'svp_simple_643_001.c'
source_filename = "svp_simple_643_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g = global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() #0 !dbg !12 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !15
  ret void, !dbg !16
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !17 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !20, metadata !DIExpression()), !dbg !21
  %3 = load i32, i32* %2, align 4, !dbg !22
  %4 = icmp ne i32 %3, 0, !dbg !24
  br i1 %4, label %7, label %5, !dbg !25

5:                                                ; preds = %1
  br label %6, !dbg !26

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !27), !dbg !29
  call void @reach_error(), !dbg !30
  call void @abort() #4, !dbg !32
  unreachable, !dbg !32

7:                                                ; preds = %1
  ret void, !dbg !33
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @pqueue_init() #0 !dbg !34 {
  store i32 0, i32* @g, align 4, !dbg !37
  ret i32 0, !dbg !38
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @pqueue_put() #0 !dbg !39 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* @g, align 4, !dbg !40
  %3 = icmp slt i32 %2, 1000, !dbg !42
  br i1 %3, label %4, label %8, !dbg !43

4:                                                ; preds = %0
  call void @llvm.dbg.declare(metadata i32* %1, metadata !44, metadata !DIExpression()), !dbg !46
  %5 = load i32, i32* @g, align 4, !dbg !47
  %6 = add nsw i32 %5, 1, !dbg !48
  store i32 %6, i32* %1, align 4, !dbg !46
  %7 = load i32, i32* %1, align 4, !dbg !49
  store i32 %7, i32* @g, align 4, !dbg !50
  br label %8, !dbg !51

8:                                                ; preds = %4, %0
  ret i32 1, !dbg !52
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @pqueue_get() #0 !dbg !53 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 0, i32* %1, align 4, !dbg !55
  %3 = load i32, i32* @g, align 4, !dbg !56
  %4 = icmp eq i32 %3, 0, !dbg !57
  %5 = zext i1 %4 to i32, !dbg !57
  call void @__VERIFIER_assert(i32 %5), !dbg !58
  %6 = load i32, i32* @g, align 4, !dbg !59
  %7 = icmp ne i32 %6, 0, !dbg !60
  %8 = zext i1 %7 to i32, !dbg !60
  call void @__VERIFIER_assert(i32 %8), !dbg !61
  %9 = load i32, i32* @g, align 4, !dbg !62
  %10 = icmp sgt i32 %9, 0, !dbg !64
  br i1 %10, label %11, label %15, !dbg !65

11:                                               ; preds = %0
  call void @llvm.dbg.declare(metadata i32* %2, metadata !66, metadata !DIExpression()), !dbg !68
  %12 = load i32, i32* @g, align 4, !dbg !69
  %13 = sub nsw i32 %12, 1, !dbg !70
  store i32 %13, i32* %2, align 4, !dbg !68
  %14 = load i32, i32* %2, align 4, !dbg !71
  store i32 %14, i32* @g, align 4, !dbg !72
  store i32 1, i32* %1, align 4, !dbg !73
  br label %15, !dbg !74

15:                                               ; preds = %11, %0
  %16 = load i32, i32* %1, align 4, !dbg !75
  ret i32 %16, !dbg !76
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @isr_pqueue_get() #0 !dbg !77 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 0, i32* %1, align 4, !dbg !79
  %2 = load i32, i32* @g, align 4, !dbg !80
  %3 = icmp eq i32 %2, 0, !dbg !81
  %4 = zext i1 %3 to i32, !dbg !81
  call void @__VERIFIER_assert(i32 %4), !dbg !82
  %5 = load i32, i32* @g, align 4, !dbg !83
  %6 = icmp ne i32 %5, 0, !dbg !84
  %7 = zext i1 %6 to i32, !dbg !84
  call void @__VERIFIER_assert(i32 %7), !dbg !85
  %8 = load i32, i32* @g, align 4, !dbg !86
  %9 = icmp sgt i32 %8, 0, !dbg !88
  br i1 %9, label %10, label %13, !dbg !89

10:                                               ; preds = %0
  %11 = load i32, i32* @g, align 4, !dbg !90
  %12 = add nsw i32 %11, -1, !dbg !90
  store i32 %12, i32* @g, align 4, !dbg !90
  store i32 1, i32* %1, align 4, !dbg !92
  br label %13, !dbg !93

13:                                               ; preds = %10, %0
  %14 = load i32, i32* %1, align 4, !dbg !94
  ret i32 %14, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_643_001_isr1(i8* %0) #0 !dbg !96 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !100, metadata !DIExpression()), !dbg !101
  %3 = call i32 @isr_pqueue_get(), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_643_001_main(i32 %0, i8** %1) #0 !dbg !104 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !110, metadata !DIExpression()), !dbg !111
  store i8** %1, i8*** %4, align 8
  call void @llvm.dbg.declare(metadata i8*** %4, metadata !112, metadata !DIExpression()), !dbg !113
  %7 = call i32 @pqueue_init(), !dbg !114
  call void @llvm.dbg.declare(metadata i32* %5, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 5, i32* %5, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata i32* %6, metadata !117, metadata !DIExpression()), !dbg !119
  store i32 1, i32* %6, align 4, !dbg !119
  br label %8, !dbg !120

8:                                                ; preds = %13, %2
  %9 = load i32, i32* %6, align 4, !dbg !121
  %10 = icmp slt i32 %9, 5, !dbg !123
  br i1 %10, label %11, label %16, !dbg !124

11:                                               ; preds = %8
  %12 = call i32 @pqueue_put(), !dbg !125
  br label %13, !dbg !127

13:                                               ; preds = %11
  %14 = load i32, i32* %6, align 4, !dbg !128
  %15 = add nsw i32 %14, 1, !dbg !128
  store i32 %15, i32* %6, align 4, !dbg !128
  br label %8, !dbg !129, !llvm.loop !130

16:                                               ; preds = %8
  ret i32 0, !dbg !132
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !3, line: 15, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_643_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{!"clang version 10.0.0 "}
!12 = distinct !DISubprogram(name: "reach_error", scope: !3, file: !3, line: 2, type: !13, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 2, column: 22, scope: !12)
!16 = !DILocation(line: 2, column: 33, scope: !12)
!17 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !3, file: !3, line: 3, type: !18, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null, !6}
!20 = !DILocalVariable(name: "cond", arg: 1, scope: !17, file: !3, line: 3, type: !6)
!21 = !DILocation(line: 3, column: 28, scope: !17)
!22 = !DILocation(line: 5, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !17, file: !3, line: 5, column: 7)
!24 = !DILocation(line: 5, column: 8, scope: !23)
!25 = !DILocation(line: 5, column: 7, scope: !17)
!26 = !DILocation(line: 6, column: 3, scope: !23)
!27 = !DILabel(scope: !28, name: "ERROR", file: !3, line: 7)
!28 = distinct !DILexicalBlock(scope: !23, file: !3, line: 6, column: 3)
!29 = !DILocation(line: 7, column: 3, scope: !28)
!30 = !DILocation(line: 9, column: 5, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !3, line: 8, column: 3)
!32 = !DILocation(line: 10, column: 5, scope: !31)
!33 = !DILocation(line: 13, column: 1, scope: !17)
!34 = distinct !DISubprogram(name: "pqueue_init", scope: !3, file: !3, line: 17, type: !35, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!35 = !DISubroutineType(types: !36)
!36 = !{!6}
!37 = !DILocation(line: 19, column: 5, scope: !34)
!38 = !DILocation(line: 20, column: 3, scope: !34)
!39 = distinct !DISubprogram(name: "pqueue_put", scope: !3, file: !3, line: 23, type: !35, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DILocation(line: 26, column: 7, scope: !41)
!41 = distinct !DILexicalBlock(scope: !39, file: !3, line: 26, column: 7)
!42 = !DILocation(line: 26, column: 9, scope: !41)
!43 = !DILocation(line: 26, column: 7, scope: !39)
!44 = !DILocalVariable(name: "tmp", scope: !45, file: !3, line: 28, type: !6)
!45 = distinct !DILexicalBlock(scope: !41, file: !3, line: 27, column: 3)
!46 = !DILocation(line: 28, column: 9, scope: !45)
!47 = !DILocation(line: 28, column: 15, scope: !45)
!48 = !DILocation(line: 28, column: 17, scope: !45)
!49 = !DILocation(line: 29, column: 9, scope: !45)
!50 = !DILocation(line: 29, column: 7, scope: !45)
!51 = !DILocation(line: 31, column: 3, scope: !45)
!52 = !DILocation(line: 33, column: 3, scope: !39)
!53 = distinct !DISubprogram(name: "pqueue_get", scope: !3, file: !3, line: 36, type: !35, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocalVariable(name: "got", scope: !53, file: !3, line: 38, type: !6)
!55 = !DILocation(line: 38, column: 7, scope: !53)
!56 = !DILocation(line: 40, column: 21, scope: !53)
!57 = !DILocation(line: 40, column: 23, scope: !53)
!58 = !DILocation(line: 40, column: 3, scope: !53)
!59 = !DILocation(line: 42, column: 21, scope: !53)
!60 = !DILocation(line: 42, column: 23, scope: !53)
!61 = !DILocation(line: 42, column: 3, scope: !53)
!62 = !DILocation(line: 43, column: 7, scope: !63)
!63 = distinct !DILexicalBlock(scope: !53, file: !3, line: 43, column: 7)
!64 = !DILocation(line: 43, column: 9, scope: !63)
!65 = !DILocation(line: 43, column: 7, scope: !53)
!66 = !DILocalVariable(name: "tmp", scope: !67, file: !3, line: 45, type: !6)
!67 = distinct !DILexicalBlock(scope: !63, file: !3, line: 44, column: 3)
!68 = !DILocation(line: 45, column: 9, scope: !67)
!69 = !DILocation(line: 45, column: 15, scope: !67)
!70 = !DILocation(line: 45, column: 17, scope: !67)
!71 = !DILocation(line: 46, column: 9, scope: !67)
!72 = !DILocation(line: 46, column: 7, scope: !67)
!73 = !DILocation(line: 48, column: 9, scope: !67)
!74 = !DILocation(line: 49, column: 3, scope: !67)
!75 = !DILocation(line: 51, column: 11, scope: !53)
!76 = !DILocation(line: 51, column: 3, scope: !53)
!77 = distinct !DISubprogram(name: "isr_pqueue_get", scope: !3, file: !3, line: 54, type: !35, scopeLine: 55, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "got", scope: !77, file: !3, line: 56, type: !6)
!79 = !DILocation(line: 56, column: 7, scope: !77)
!80 = !DILocation(line: 58, column: 21, scope: !77)
!81 = !DILocation(line: 58, column: 23, scope: !77)
!82 = !DILocation(line: 58, column: 3, scope: !77)
!83 = !DILocation(line: 60, column: 21, scope: !77)
!84 = !DILocation(line: 60, column: 23, scope: !77)
!85 = !DILocation(line: 60, column: 3, scope: !77)
!86 = !DILocation(line: 61, column: 7, scope: !87)
!87 = distinct !DILexicalBlock(scope: !77, file: !3, line: 61, column: 7)
!88 = !DILocation(line: 61, column: 9, scope: !87)
!89 = !DILocation(line: 61, column: 7, scope: !77)
!90 = !DILocation(line: 63, column: 6, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !3, line: 62, column: 3)
!92 = !DILocation(line: 64, column: 9, scope: !91)
!93 = !DILocation(line: 65, column: 3, scope: !91)
!94 = !DILocation(line: 67, column: 11, scope: !77)
!95 = !DILocation(line: 67, column: 3, scope: !77)
!96 = distinct !DISubprogram(name: "svp_simple_643_001_isr1", scope: !3, file: !3, line: 70, type: !97, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DISubroutineType(types: !98)
!98 = !{null, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!100 = !DILocalVariable(name: "arg", arg: 1, scope: !96, file: !3, line: 70, type: !99)
!101 = !DILocation(line: 70, column: 36, scope: !96)
!102 = !DILocation(line: 73, column: 3, scope: !96)
!103 = !DILocation(line: 74, column: 1, scope: !96)
!104 = distinct !DISubprogram(name: "svp_simple_643_001_main", scope: !3, file: !3, line: 76, type: !105, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DISubroutineType(types: !106)
!106 = !{!6, !6, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !104, file: !3, line: 76, type: !6)
!111 = !DILocation(line: 76, column: 33, scope: !104)
!112 = !DILocalVariable(name: "argv", arg: 2, scope: !104, file: !3, line: 76, type: !107)
!113 = !DILocation(line: 76, column: 46, scope: !104)
!114 = !DILocation(line: 79, column: 3, scope: !104)
!115 = !DILocalVariable(name: "num", scope: !104, file: !3, line: 81, type: !6)
!116 = !DILocation(line: 81, column: 7, scope: !104)
!117 = !DILocalVariable(name: "i", scope: !118, file: !3, line: 82, type: !6)
!118 = distinct !DILexicalBlock(scope: !104, file: !3, line: 82, column: 3)
!119 = !DILocation(line: 82, column: 12, scope: !118)
!120 = !DILocation(line: 82, column: 8, scope: !118)
!121 = !DILocation(line: 82, column: 19, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !3, line: 82, column: 3)
!123 = !DILocation(line: 82, column: 21, scope: !122)
!124 = !DILocation(line: 82, column: 3, scope: !118)
!125 = !DILocation(line: 84, column: 5, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !3, line: 83, column: 3)
!127 = !DILocation(line: 85, column: 3, scope: !126)
!128 = !DILocation(line: 82, column: 27, scope: !122)
!129 = !DILocation(line: 82, column: 3, scope: !122)
!130 = distinct !{!130, !124, !131}
!131 = !DILocation(line: 85, column: 3, scope: !118)
!132 = !DILocation(line: 86, column: 3, scope: !104)
