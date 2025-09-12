; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_643_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_643_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g = global i32 0, align 4, !dbg !0

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
define i32 @pqueue_init() #0 !dbg !36 {
  store i32 0, i32* @g, align 4, !dbg !39
  ret i32 0, !dbg !40
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @pqueue_put() #0 !dbg !41 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* @g, align 4, !dbg !42
  %3 = icmp slt i32 %2, 1000, !dbg !44
  br i1 %3, label %4, label %8, !dbg !45

4:                                                ; preds = %0
  call void @llvm.dbg.declare(metadata i32* %1, metadata !46, metadata !DIExpression()), !dbg !48
  %5 = load i32, i32* @g, align 4, !dbg !49
  %6 = add nsw i32 %5, 1, !dbg !50
  store i32 %6, i32* %1, align 4, !dbg !48
  %7 = load i32, i32* %1, align 4, !dbg !51
  store i32 %7, i32* @g, align 4, !dbg !52
  br label %8, !dbg !53

8:                                                ; preds = %4, %0
  ret i32 1, !dbg !54
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @pqueue_get() #0 !dbg !55 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !56, metadata !DIExpression()), !dbg !57
  store i32 0, i32* %1, align 4, !dbg !57
  %3 = load i32, i32* @g, align 4, !dbg !58
  %4 = icmp eq i32 %3, 0, !dbg !59
  %5 = zext i1 %4 to i32, !dbg !59
  call void @__VERIFIER_assert(i32 %5), !dbg !60
  %6 = load i32, i32* @g, align 4, !dbg !61
  %7 = icmp ne i32 %6, 0, !dbg !62
  %8 = zext i1 %7 to i32, !dbg !62
  call void @__VERIFIER_assert(i32 %8), !dbg !63
  %9 = load i32, i32* @g, align 4, !dbg !64
  %10 = icmp sgt i32 %9, 0, !dbg !66
  br i1 %10, label %11, label %15, !dbg !67

11:                                               ; preds = %0
  call void @llvm.dbg.declare(metadata i32* %2, metadata !68, metadata !DIExpression()), !dbg !70
  %12 = load i32, i32* @g, align 4, !dbg !71
  %13 = sub nsw i32 %12, 1, !dbg !72
  store i32 %13, i32* %2, align 4, !dbg !70
  %14 = load i32, i32* %2, align 4, !dbg !73
  store i32 %14, i32* @g, align 4, !dbg !74
  store i32 1, i32* %1, align 4, !dbg !75
  br label %15, !dbg !76

15:                                               ; preds = %11, %0
  %16 = load i32, i32* %1, align 4, !dbg !77
  ret i32 %16, !dbg !78
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @isr_pqueue_get() #0 !dbg !79 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !80, metadata !DIExpression()), !dbg !81
  store i32 0, i32* %1, align 4, !dbg !81
  %2 = load i32, i32* @g, align 4, !dbg !82
  %3 = icmp eq i32 %2, 0, !dbg !83
  %4 = zext i1 %3 to i32, !dbg !83
  call void @__VERIFIER_assert(i32 %4), !dbg !84
  %5 = load i32, i32* @g, align 4, !dbg !85
  %6 = icmp ne i32 %5, 0, !dbg !86
  %7 = zext i1 %6 to i32, !dbg !86
  call void @__VERIFIER_assert(i32 %7), !dbg !87
  %8 = load i32, i32* @g, align 4, !dbg !88
  %9 = icmp sgt i32 %8, 0, !dbg !90
  br i1 %9, label %10, label %13, !dbg !91

10:                                               ; preds = %0
  %11 = load i32, i32* @g, align 4, !dbg !92
  %12 = add nsw i32 %11, -1, !dbg !92
  store i32 %12, i32* @g, align 4, !dbg !92
  store i32 1, i32* %1, align 4, !dbg !94
  br label %13, !dbg !95

13:                                               ; preds = %10, %0
  %14 = load i32, i32* %1, align 4, !dbg !96
  ret i32 %14, !dbg !97
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_643_001_isr1(i8* %0) #0 !dbg !98 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !102, metadata !DIExpression()), !dbg !103
  %3 = call i32 @isr_pqueue_get(), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_643_001_main(i32 %0, i8** %1) #0 !dbg !106 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !112, metadata !DIExpression()), !dbg !113
  store i8** %1, i8*** %4, align 8
  call void @llvm.dbg.declare(metadata i8*** %4, metadata !114, metadata !DIExpression()), !dbg !115
  %7 = call i32 @pqueue_init(), !dbg !116
  call void @llvm.dbg.declare(metadata i32* %5, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 5, i32* %5, align 4, !dbg !118
  call void @llvm.dbg.declare(metadata i32* %6, metadata !119, metadata !DIExpression()), !dbg !121
  store i32 1, i32* %6, align 4, !dbg !121
  br label %8, !dbg !122

8:                                                ; preds = %13, %2
  %9 = load i32, i32* %6, align 4, !dbg !123
  %10 = icmp slt i32 %9, 5, !dbg !125
  br i1 %10, label %11, label %16, !dbg !126

11:                                               ; preds = %8
  %12 = call i32 @pqueue_put(), !dbg !127
  br label %13, !dbg !129

13:                                               ; preds = %11
  %14 = load i32, i32* %6, align 4, !dbg !130
  %15 = add nsw i32 %14, 1, !dbg !130
  store i32 %15, i32* %6, align 4, !dbg !130
  br label %8, !dbg !131, !llvm.loop !132

16:                                               ; preds = %8
  ret i32 0, !dbg !134
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !6, line: 15, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_643_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_643_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "reach_error", scope: !6, file: !6, line: 2, type: !15, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocation(line: 2, column: 22, scope: !14)
!18 = !DILocation(line: 2, column: 33, scope: !14)
!19 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !6, file: !6, line: 3, type: !20, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !7}
!22 = !DILocalVariable(name: "cond", arg: 1, scope: !19, file: !6, line: 3, type: !7)
!23 = !DILocation(line: 3, column: 28, scope: !19)
!24 = !DILocation(line: 5, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !19, file: !6, line: 5, column: 7)
!26 = !DILocation(line: 5, column: 8, scope: !25)
!27 = !DILocation(line: 5, column: 7, scope: !19)
!28 = !DILocation(line: 6, column: 3, scope: !25)
!29 = !DILabel(scope: !30, name: "ERROR", file: !6, line: 7)
!30 = distinct !DILexicalBlock(scope: !25, file: !6, line: 6, column: 3)
!31 = !DILocation(line: 7, column: 3, scope: !30)
!32 = !DILocation(line: 9, column: 5, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !6, line: 8, column: 3)
!34 = !DILocation(line: 10, column: 5, scope: !33)
!35 = !DILocation(line: 13, column: 1, scope: !19)
!36 = distinct !DISubprogram(name: "pqueue_init", scope: !6, file: !6, line: 17, type: !37, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DISubroutineType(types: !38)
!38 = !{!7}
!39 = !DILocation(line: 19, column: 5, scope: !36)
!40 = !DILocation(line: 20, column: 3, scope: !36)
!41 = distinct !DISubprogram(name: "pqueue_put", scope: !6, file: !6, line: 23, type: !37, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DILocation(line: 26, column: 7, scope: !43)
!43 = distinct !DILexicalBlock(scope: !41, file: !6, line: 26, column: 7)
!44 = !DILocation(line: 26, column: 9, scope: !43)
!45 = !DILocation(line: 26, column: 7, scope: !41)
!46 = !DILocalVariable(name: "tmp", scope: !47, file: !6, line: 28, type: !7)
!47 = distinct !DILexicalBlock(scope: !43, file: !6, line: 27, column: 3)
!48 = !DILocation(line: 28, column: 9, scope: !47)
!49 = !DILocation(line: 28, column: 15, scope: !47)
!50 = !DILocation(line: 28, column: 17, scope: !47)
!51 = !DILocation(line: 29, column: 9, scope: !47)
!52 = !DILocation(line: 29, column: 7, scope: !47)
!53 = !DILocation(line: 31, column: 3, scope: !47)
!54 = !DILocation(line: 33, column: 3, scope: !41)
!55 = distinct !DISubprogram(name: "pqueue_get", scope: !6, file: !6, line: 36, type: !37, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocalVariable(name: "got", scope: !55, file: !6, line: 38, type: !7)
!57 = !DILocation(line: 38, column: 7, scope: !55)
!58 = !DILocation(line: 40, column: 21, scope: !55)
!59 = !DILocation(line: 40, column: 23, scope: !55)
!60 = !DILocation(line: 40, column: 3, scope: !55)
!61 = !DILocation(line: 42, column: 21, scope: !55)
!62 = !DILocation(line: 42, column: 23, scope: !55)
!63 = !DILocation(line: 42, column: 3, scope: !55)
!64 = !DILocation(line: 43, column: 7, scope: !65)
!65 = distinct !DILexicalBlock(scope: !55, file: !6, line: 43, column: 7)
!66 = !DILocation(line: 43, column: 9, scope: !65)
!67 = !DILocation(line: 43, column: 7, scope: !55)
!68 = !DILocalVariable(name: "tmp", scope: !69, file: !6, line: 45, type: !7)
!69 = distinct !DILexicalBlock(scope: !65, file: !6, line: 44, column: 3)
!70 = !DILocation(line: 45, column: 9, scope: !69)
!71 = !DILocation(line: 45, column: 15, scope: !69)
!72 = !DILocation(line: 45, column: 17, scope: !69)
!73 = !DILocation(line: 46, column: 9, scope: !69)
!74 = !DILocation(line: 46, column: 7, scope: !69)
!75 = !DILocation(line: 48, column: 9, scope: !69)
!76 = !DILocation(line: 49, column: 3, scope: !69)
!77 = !DILocation(line: 51, column: 11, scope: !55)
!78 = !DILocation(line: 51, column: 3, scope: !55)
!79 = distinct !DISubprogram(name: "isr_pqueue_get", scope: !6, file: !6, line: 54, type: !37, scopeLine: 55, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "got", scope: !79, file: !6, line: 56, type: !7)
!81 = !DILocation(line: 56, column: 7, scope: !79)
!82 = !DILocation(line: 58, column: 21, scope: !79)
!83 = !DILocation(line: 58, column: 23, scope: !79)
!84 = !DILocation(line: 58, column: 3, scope: !79)
!85 = !DILocation(line: 60, column: 21, scope: !79)
!86 = !DILocation(line: 60, column: 23, scope: !79)
!87 = !DILocation(line: 60, column: 3, scope: !79)
!88 = !DILocation(line: 61, column: 7, scope: !89)
!89 = distinct !DILexicalBlock(scope: !79, file: !6, line: 61, column: 7)
!90 = !DILocation(line: 61, column: 9, scope: !89)
!91 = !DILocation(line: 61, column: 7, scope: !79)
!92 = !DILocation(line: 63, column: 6, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !6, line: 62, column: 3)
!94 = !DILocation(line: 64, column: 9, scope: !93)
!95 = !DILocation(line: 65, column: 3, scope: !93)
!96 = !DILocation(line: 67, column: 11, scope: !79)
!97 = !DILocation(line: 67, column: 3, scope: !79)
!98 = distinct !DISubprogram(name: "svp_simple_643_001_isr1", scope: !6, file: !6, line: 70, type: !99, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DISubroutineType(types: !100)
!100 = !{null, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!102 = !DILocalVariable(name: "arg", arg: 1, scope: !98, file: !6, line: 70, type: !101)
!103 = !DILocation(line: 70, column: 36, scope: !98)
!104 = !DILocation(line: 73, column: 3, scope: !98)
!105 = !DILocation(line: 74, column: 1, scope: !98)
!106 = distinct !DISubprogram(name: "svp_simple_643_001_main", scope: !6, file: !6, line: 76, type: !107, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DISubroutineType(types: !108)
!108 = !{!7, !7, !109}
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!111 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!112 = !DILocalVariable(name: "argc", arg: 1, scope: !106, file: !6, line: 76, type: !7)
!113 = !DILocation(line: 76, column: 33, scope: !106)
!114 = !DILocalVariable(name: "argv", arg: 2, scope: !106, file: !6, line: 76, type: !109)
!115 = !DILocation(line: 76, column: 46, scope: !106)
!116 = !DILocation(line: 79, column: 3, scope: !106)
!117 = !DILocalVariable(name: "num", scope: !106, file: !6, line: 81, type: !7)
!118 = !DILocation(line: 81, column: 7, scope: !106)
!119 = !DILocalVariable(name: "i", scope: !120, file: !6, line: 82, type: !7)
!120 = distinct !DILexicalBlock(scope: !106, file: !6, line: 82, column: 3)
!121 = !DILocation(line: 82, column: 12, scope: !120)
!122 = !DILocation(line: 82, column: 8, scope: !120)
!123 = !DILocation(line: 82, column: 19, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !6, line: 82, column: 3)
!125 = !DILocation(line: 82, column: 21, scope: !124)
!126 = !DILocation(line: 82, column: 3, scope: !120)
!127 = !DILocation(line: 84, column: 5, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !6, line: 83, column: 3)
!129 = !DILocation(line: 85, column: 3, scope: !128)
!130 = !DILocation(line: 82, column: 27, scope: !124)
!131 = !DILocation(line: 82, column: 3, scope: !124)
!132 = distinct !{!132, !126, !133}
!133 = !DILocation(line: 85, column: 3, scope: !120)
!134 = !DILocation(line: 86, column: 3, scope: !106)
