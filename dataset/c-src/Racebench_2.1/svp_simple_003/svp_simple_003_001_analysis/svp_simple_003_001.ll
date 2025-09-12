; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_003/svp_simple_003_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_003/svp_simple_003_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_003_001_global_flag = global i32 0, align 4, !dbg !0
@svp_simple_003_001_global_flag1 = global i32 0, align 4, !dbg !6
@svp_simple_003_001_global_var2 = common global i32 0, align 4, !dbg !13
@svp_simple_003_001_global_var1 = common global i32 0, align 4, !dbg !11

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_003_001_main() #0 !dbg !21 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  call void (...) @init(), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %1, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32* %2, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %3, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %4, metadata !31, metadata !DIExpression()), !dbg !32
  call void (...) @idlerun(), !dbg !33
  call void @disable_isr(i32 1), !dbg !34
  call void @disable_isr(i32 2), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %5, metadata !36, metadata !DIExpression()), !dbg !38
  store i32 0, i32* %5, align 4, !dbg !38
  br label %9, !dbg !39

9:                                                ; preds = %18, %0
  %10 = load i32, i32* %5, align 4, !dbg !40
  %11 = icmp slt i32 %10, 10000, !dbg !42
  br i1 %11, label %12, label %21, !dbg !43

12:                                               ; preds = %9
  %13 = load i32, i32* %5, align 4, !dbg !44
  %14 = icmp eq i32 %13, 9999, !dbg !47
  br i1 %14, label %15, label %17, !dbg !48

15:                                               ; preds = %12
  %16 = load volatile i32, i32* @svp_simple_003_001_global_var2, align 4, !dbg !49
  store i32 %16, i32* %3, align 4, !dbg !51
  br label %17, !dbg !52

17:                                               ; preds = %15, %12
  br label %18, !dbg !53

18:                                               ; preds = %17
  %19 = load i32, i32* %5, align 4, !dbg !54
  %20 = add nsw i32 %19, 1, !dbg !54
  store i32 %20, i32* %5, align 4, !dbg !54
  br label %9, !dbg !55, !llvm.loop !56

21:                                               ; preds = %9
  call void @llvm.dbg.declare(metadata i32* %6, metadata !58, metadata !DIExpression()), !dbg !60
  store i32 10000, i32* %6, align 4, !dbg !60
  br label %22, !dbg !61

22:                                               ; preds = %31, %21
  %23 = load i32, i32* %6, align 4, !dbg !62
  %24 = icmp sgt i32 %23, 0, !dbg !64
  br i1 %24, label %25, label %34, !dbg !65

25:                                               ; preds = %22
  %26 = load i32, i32* %6, align 4, !dbg !66
  %27 = icmp eq i32 %26, 9999, !dbg !69
  br i1 %27, label %28, label %30, !dbg !70

28:                                               ; preds = %25
  %29 = load volatile i32, i32* @svp_simple_003_001_global_var2, align 4, !dbg !71
  store i32 %29, i32* %4, align 4, !dbg !73
  br label %30, !dbg !74

30:                                               ; preds = %28, %25
  br label %31, !dbg !75

31:                                               ; preds = %30
  %32 = load i32, i32* %6, align 4, !dbg !76
  %33 = add nsw i32 %32, -1, !dbg !76
  store i32 %33, i32* %6, align 4, !dbg !76
  br label %22, !dbg !77, !llvm.loop !78

34:                                               ; preds = %22
  call void @enable_isr(i32 1), !dbg !80
  call void @llvm.dbg.declare(metadata i32* %7, metadata !81, metadata !DIExpression()), !dbg !83
  store i32 0, i32* %7, align 4, !dbg !83
  br label %35, !dbg !84

35:                                               ; preds = %44, %34
  %36 = load i32, i32* %7, align 4, !dbg !85
  %37 = icmp slt i32 %36, 10000, !dbg !87
  br i1 %37, label %38, label %47, !dbg !88

38:                                               ; preds = %35
  %39 = load i32, i32* %7, align 4, !dbg !89
  %40 = icmp eq i32 %39, 9999, !dbg !92
  br i1 %40, label %41, label %43, !dbg !93

41:                                               ; preds = %38
  %42 = load volatile i32, i32* @svp_simple_003_001_global_var1, align 4, !dbg !94
  store i32 %42, i32* %1, align 4, !dbg !96
  br label %43, !dbg !97

43:                                               ; preds = %41, %38
  br label %44, !dbg !98

44:                                               ; preds = %43
  %45 = load i32, i32* %7, align 4, !dbg !99
  %46 = add nsw i32 %45, 1, !dbg !99
  store i32 %46, i32* %7, align 4, !dbg !99
  br label %35, !dbg !100, !llvm.loop !101

47:                                               ; preds = %35
  call void @llvm.dbg.declare(metadata i32* %8, metadata !103, metadata !DIExpression()), !dbg !105
  store i32 10000, i32* %8, align 4, !dbg !105
  br label %48, !dbg !106

48:                                               ; preds = %57, %47
  %49 = load i32, i32* %8, align 4, !dbg !107
  %50 = icmp sgt i32 %49, 0, !dbg !109
  br i1 %50, label %51, label %60, !dbg !110

51:                                               ; preds = %48
  %52 = load i32, i32* %8, align 4, !dbg !111
  %53 = icmp eq i32 %52, 9999, !dbg !114
  br i1 %53, label %54, label %56, !dbg !115

54:                                               ; preds = %51
  %55 = load volatile i32, i32* @svp_simple_003_001_global_var1, align 4, !dbg !116
  store i32 %55, i32* %2, align 4, !dbg !118
  br label %56, !dbg !119

56:                                               ; preds = %54, %51
  br label %57, !dbg !120

57:                                               ; preds = %56
  %58 = load i32, i32* %8, align 4, !dbg !121
  %59 = add nsw i32 %58, -1, !dbg !121
  store i32 %59, i32* %8, align 4, !dbg !121
  br label %48, !dbg !122, !llvm.loop !123

60:                                               ; preds = %48
  ret void, !dbg !125
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare void @idlerun(...) #1

declare void @disable_isr(i32) #1

declare void @enable_isr(i32) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_003_001_isr_1() #0 !dbg !126 {
  call void @enable_isr(i32 2), !dbg !127
  store volatile i32 999, i32* @svp_simple_003_001_global_var2, align 4, !dbg !128
  %1 = load volatile i32, i32* @svp_simple_003_001_global_flag, align 4, !dbg !129
  %2 = icmp eq i32 %1, 1, !dbg !131
  br i1 %2, label %3, label %4, !dbg !132

3:                                                ; preds = %0
  store volatile i32 999, i32* @svp_simple_003_001_global_var1, align 4, !dbg !133
  br label %9, !dbg !135

4:                                                ; preds = %0
  %5 = load volatile i32, i32* @svp_simple_003_001_global_flag1, align 4, !dbg !136
  %6 = icmp eq i32 %5, 2, !dbg !138
  br i1 %6, label %7, label %8, !dbg !139

7:                                                ; preds = %4
  store volatile i32 888, i32* @svp_simple_003_001_global_var1, align 4, !dbg !140
  br label %8, !dbg !142

8:                                                ; preds = %7, %4
  br label %9

9:                                                ; preds = %8, %3
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_003_001_isr_2() #0 !dbg !144 {
  call void (...) @idlerun(), !dbg !145
  store volatile i32 1, i32* @svp_simple_003_001_global_flag, align 4, !dbg !146
  ret void, !dbg !147
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_003_001_global_flag", scope: !2, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_003/svp_simple_003_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6, !11, !13}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_003_001_global_flag1", scope: !2, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_003/svp_simple_003_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "svp_simple_003_001_global_var1", scope: !2, file: !8, line: 7, type: !9, isLocal: false, isDefinition: true)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "svp_simple_003_001_global_var2", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!15 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{!"clang version 10.0.0 "}
!21 = distinct !DISubprogram(name: "svp_simple_003_001_main", scope: !8, file: !8, line: 12, type: !22, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocation(line: 13, column: 3, scope: !21)
!25 = !DILocalVariable(name: "reader1", scope: !21, file: !8, line: 14, type: !10)
!26 = !DILocation(line: 14, column: 7, scope: !21)
!27 = !DILocalVariable(name: "reader2", scope: !21, file: !8, line: 14, type: !10)
!28 = !DILocation(line: 14, column: 16, scope: !21)
!29 = !DILocalVariable(name: "reader3", scope: !21, file: !8, line: 15, type: !10)
!30 = !DILocation(line: 15, column: 7, scope: !21)
!31 = !DILocalVariable(name: "reader4", scope: !21, file: !8, line: 15, type: !10)
!32 = !DILocation(line: 15, column: 16, scope: !21)
!33 = !DILocation(line: 16, column: 3, scope: !21)
!34 = !DILocation(line: 18, column: 3, scope: !21)
!35 = !DILocation(line: 19, column: 3, scope: !21)
!36 = !DILocalVariable(name: "i", scope: !37, file: !8, line: 21, type: !10)
!37 = distinct !DILexicalBlock(scope: !21, file: !8, line: 21, column: 3)
!38 = !DILocation(line: 21, column: 12, scope: !37)
!39 = !DILocation(line: 21, column: 8, scope: !37)
!40 = !DILocation(line: 21, column: 19, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !8, line: 21, column: 3)
!42 = !DILocation(line: 21, column: 21, scope: !41)
!43 = !DILocation(line: 21, column: 3, scope: !37)
!44 = !DILocation(line: 22, column: 9, scope: !45)
!45 = distinct !DILexicalBlock(scope: !46, file: !8, line: 22, column: 9)
!46 = distinct !DILexicalBlock(scope: !41, file: !8, line: 21, column: 40)
!47 = !DILocation(line: 22, column: 11, scope: !45)
!48 = !DILocation(line: 22, column: 9, scope: !46)
!49 = !DILocation(line: 23, column: 17, scope: !50)
!50 = distinct !DILexicalBlock(scope: !45, file: !8, line: 22, column: 23)
!51 = !DILocation(line: 23, column: 15, scope: !50)
!52 = !DILocation(line: 24, column: 5, scope: !50)
!53 = !DILocation(line: 25, column: 3, scope: !46)
!54 = !DILocation(line: 21, column: 36, scope: !41)
!55 = !DILocation(line: 21, column: 3, scope: !41)
!56 = distinct !{!56, !43, !57}
!57 = !DILocation(line: 25, column: 3, scope: !37)
!58 = !DILocalVariable(name: "j", scope: !59, file: !8, line: 26, type: !10)
!59 = distinct !DILexicalBlock(scope: !21, file: !8, line: 26, column: 3)
!60 = !DILocation(line: 26, column: 12, scope: !59)
!61 = !DILocation(line: 26, column: 8, scope: !59)
!62 = !DILocation(line: 26, column: 28, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !8, line: 26, column: 3)
!64 = !DILocation(line: 26, column: 30, scope: !63)
!65 = !DILocation(line: 26, column: 3, scope: !59)
!66 = !DILocation(line: 27, column: 9, scope: !67)
!67 = distinct !DILexicalBlock(scope: !68, file: !8, line: 27, column: 9)
!68 = distinct !DILexicalBlock(scope: !63, file: !8, line: 26, column: 40)
!69 = !DILocation(line: 27, column: 11, scope: !67)
!70 = !DILocation(line: 27, column: 9, scope: !68)
!71 = !DILocation(line: 28, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !8, line: 27, column: 23)
!73 = !DILocation(line: 28, column: 15, scope: !72)
!74 = !DILocation(line: 29, column: 5, scope: !72)
!75 = !DILocation(line: 30, column: 3, scope: !68)
!76 = !DILocation(line: 26, column: 36, scope: !63)
!77 = !DILocation(line: 26, column: 3, scope: !63)
!78 = distinct !{!78, !65, !79}
!79 = !DILocation(line: 30, column: 3, scope: !59)
!80 = !DILocation(line: 32, column: 3, scope: !21)
!81 = !DILocalVariable(name: "i", scope: !82, file: !8, line: 33, type: !10)
!82 = distinct !DILexicalBlock(scope: !21, file: !8, line: 33, column: 3)
!83 = !DILocation(line: 33, column: 12, scope: !82)
!84 = !DILocation(line: 33, column: 8, scope: !82)
!85 = !DILocation(line: 33, column: 19, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !8, line: 33, column: 3)
!87 = !DILocation(line: 33, column: 21, scope: !86)
!88 = !DILocation(line: 33, column: 3, scope: !82)
!89 = !DILocation(line: 34, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !91, file: !8, line: 34, column: 9)
!91 = distinct !DILexicalBlock(scope: !86, file: !8, line: 33, column: 40)
!92 = !DILocation(line: 34, column: 11, scope: !90)
!93 = !DILocation(line: 34, column: 9, scope: !91)
!94 = !DILocation(line: 35, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !8, line: 34, column: 23)
!96 = !DILocation(line: 35, column: 15, scope: !95)
!97 = !DILocation(line: 36, column: 5, scope: !95)
!98 = !DILocation(line: 37, column: 3, scope: !91)
!99 = !DILocation(line: 33, column: 36, scope: !86)
!100 = !DILocation(line: 33, column: 3, scope: !86)
!101 = distinct !{!101, !88, !102}
!102 = !DILocation(line: 37, column: 3, scope: !82)
!103 = !DILocalVariable(name: "j", scope: !104, file: !8, line: 38, type: !10)
!104 = distinct !DILexicalBlock(scope: !21, file: !8, line: 38, column: 3)
!105 = !DILocation(line: 38, column: 12, scope: !104)
!106 = !DILocation(line: 38, column: 8, scope: !104)
!107 = !DILocation(line: 38, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !8, line: 38, column: 3)
!109 = !DILocation(line: 38, column: 30, scope: !108)
!110 = !DILocation(line: 38, column: 3, scope: !104)
!111 = !DILocation(line: 39, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !113, file: !8, line: 39, column: 9)
!113 = distinct !DILexicalBlock(scope: !108, file: !8, line: 38, column: 40)
!114 = !DILocation(line: 39, column: 11, scope: !112)
!115 = !DILocation(line: 39, column: 9, scope: !113)
!116 = !DILocation(line: 40, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !8, line: 39, column: 23)
!118 = !DILocation(line: 40, column: 15, scope: !117)
!119 = !DILocation(line: 41, column: 5, scope: !117)
!120 = !DILocation(line: 42, column: 3, scope: !113)
!121 = !DILocation(line: 38, column: 36, scope: !108)
!122 = !DILocation(line: 38, column: 3, scope: !108)
!123 = distinct !{!123, !110, !124}
!124 = !DILocation(line: 42, column: 3, scope: !104)
!125 = !DILocation(line: 43, column: 1, scope: !21)
!126 = distinct !DISubprogram(name: "svp_simple_003_001_isr_1", scope: !8, file: !8, line: 45, type: !22, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!127 = !DILocation(line: 46, column: 3, scope: !126)
!128 = !DILocation(line: 47, column: 34, scope: !126)
!129 = !DILocation(line: 49, column: 7, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !8, line: 49, column: 7)
!131 = !DILocation(line: 49, column: 38, scope: !130)
!132 = !DILocation(line: 49, column: 7, scope: !126)
!133 = !DILocation(line: 50, column: 36, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !8, line: 49, column: 44)
!135 = !DILocation(line: 51, column: 3, scope: !134)
!136 = !DILocation(line: 51, column: 14, scope: !137)
!137 = distinct !DILexicalBlock(scope: !130, file: !8, line: 51, column: 14)
!138 = !DILocation(line: 51, column: 46, scope: !137)
!139 = !DILocation(line: 51, column: 14, scope: !130)
!140 = !DILocation(line: 52, column: 36, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !8, line: 51, column: 52)
!142 = !DILocation(line: 53, column: 3, scope: !141)
!143 = !DILocation(line: 54, column: 1, scope: !126)
!144 = distinct !DISubprogram(name: "svp_simple_003_001_isr_2", scope: !8, file: !8, line: 56, type: !22, scopeLine: 56, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!145 = !DILocation(line: 57, column: 3, scope: !144)
!146 = !DILocation(line: 58, column: 34, scope: !144)
!147 = !DILocation(line: 59, column: 1, scope: !144)
