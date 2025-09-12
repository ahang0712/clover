; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_006/svp_simple_006_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_006/svp_simple_006_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@flag = global i8 85, align 1, !dbg !0
@svp_simple_006_001_global_var1 = common global i32 0, align 4, !dbg !6
@svp_simple_006_001_global_var2 = common global i32 0, align 4, !dbg !11

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_006_001_main() #0 !dbg !21 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  call void (...) @init(), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %1, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32* %2, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %3, metadata !29, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %3, align 4, !dbg !31
  br label %7, !dbg !32

7:                                                ; preds = %41, %0
  %8 = load i32, i32* %3, align 4, !dbg !33
  %9 = icmp slt i32 %8, 5, !dbg !35
  br i1 %9, label %10, label %44, !dbg !36

10:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata i32* %4, metadata !37, metadata !DIExpression()), !dbg !40
  store i32 0, i32* %4, align 4, !dbg !40
  br label %11, !dbg !41

11:                                               ; preds = %37, %10
  %12 = load i32, i32* %4, align 4, !dbg !42
  %13 = icmp slt i32 %12, 5, !dbg !44
  br i1 %13, label %14, label %40, !dbg !45

14:                                               ; preds = %11
  %15 = load i32, i32* %3, align 4, !dbg !46
  %16 = load i32, i32* %4, align 4, !dbg !49
  %17 = icmp eq i32 %15, %16, !dbg !50
  br i1 %17, label %18, label %36, !dbg !51

18:                                               ; preds = %14
  %19 = load i32, i32* %3, align 4, !dbg !52
  %20 = icmp eq i32 %19, 0, !dbg !55
  br i1 %20, label %21, label %23, !dbg !56

21:                                               ; preds = %18
  %22 = load volatile i32, i32* @svp_simple_006_001_global_var1, align 4, !dbg !57
  store i32 %22, i32* %1, align 4, !dbg !58
  br label %35, !dbg !59

23:                                               ; preds = %18
  %24 = load i32, i32* %3, align 4, !dbg !60
  %25 = icmp eq i32 %24, 4, !dbg !62
  br i1 %25, label %26, label %28, !dbg !63

26:                                               ; preds = %23
  %27 = load volatile i32, i32* @svp_simple_006_001_global_var1, align 4, !dbg !64
  store i32 %27, i32* %2, align 4, !dbg !65
  br label %34, !dbg !66

28:                                               ; preds = %23
  %29 = load i32, i32* %3, align 4, !dbg !67
  %30 = icmp eq i32 %29, 6, !dbg !69
  br i1 %30, label %31, label %33, !dbg !70

31:                                               ; preds = %28
  %32 = load volatile i32, i32* @svp_simple_006_001_global_var1, align 4, !dbg !71
  store i32 %32, i32* %2, align 4, !dbg !72
  br label %33, !dbg !73

33:                                               ; preds = %31, %28
  br label %34

34:                                               ; preds = %33, %26
  br label %35

35:                                               ; preds = %34, %21
  br label %36, !dbg !74

36:                                               ; preds = %35, %14
  br label %37, !dbg !75

37:                                               ; preds = %36
  %38 = load i32, i32* %4, align 4, !dbg !76
  %39 = add nsw i32 %38, 1, !dbg !76
  store i32 %39, i32* %4, align 4, !dbg !76
  br label %11, !dbg !77, !llvm.loop !78

40:                                               ; preds = %11
  br label %41, !dbg !80

41:                                               ; preds = %40
  %42 = load i32, i32* %3, align 4, !dbg !81
  %43 = add nsw i32 %42, 1, !dbg !81
  store i32 %43, i32* %3, align 4, !dbg !81
  br label %7, !dbg !82, !llvm.loop !83

44:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata i32* %5, metadata !85, metadata !DIExpression()), !dbg !87
  store i32 0, i32* %5, align 4, !dbg !87
  br label %45, !dbg !88

45:                                               ; preds = %67, %44
  %46 = load i32, i32* %5, align 4, !dbg !89
  %47 = icmp slt i32 %46, 5, !dbg !91
  br i1 %47, label %48, label %70, !dbg !92

48:                                               ; preds = %45
  call void @llvm.dbg.declare(metadata i32* %6, metadata !93, metadata !DIExpression()), !dbg !96
  store i32 0, i32* %6, align 4, !dbg !96
  br label %49, !dbg !97

49:                                               ; preds = %63, %48
  %50 = load i32, i32* %6, align 4, !dbg !98
  %51 = icmp slt i32 %50, 5, !dbg !100
  br i1 %51, label %52, label %66, !dbg !101

52:                                               ; preds = %49
  %53 = load i32, i32* %5, align 4, !dbg !102
  %54 = load i32, i32* %6, align 4, !dbg !105
  %55 = add nsw i32 %53, %54, !dbg !106
  %56 = icmp eq i32 %55, 6, !dbg !107
  br i1 %56, label %57, label %62, !dbg !108

57:                                               ; preds = %52
  %58 = load i32, i32* %5, align 4, !dbg !109
  %59 = load i32, i32* %6, align 4, !dbg !110
  %60 = icmp slt i32 %58, %59, !dbg !111
  br i1 %60, label %61, label %62, !dbg !112

61:                                               ; preds = %57
  store volatile i32 2, i32* @svp_simple_006_001_global_var2, align 4, !dbg !113
  br label %62, !dbg !114

62:                                               ; preds = %61, %57, %52
  br label %63, !dbg !115

63:                                               ; preds = %62
  %64 = load i32, i32* %6, align 4, !dbg !116
  %65 = add nsw i32 %64, 1, !dbg !116
  store i32 %65, i32* %6, align 4, !dbg !116
  br label %49, !dbg !117, !llvm.loop !118

66:                                               ; preds = %49
  br label %67, !dbg !120

67:                                               ; preds = %66
  %68 = load i32, i32* %5, align 4, !dbg !121
  %69 = add nsw i32 %68, 1, !dbg !121
  store i32 %69, i32* %5, align 4, !dbg !121
  br label %45, !dbg !122, !llvm.loop !123

70:                                               ; preds = %45
  ret void, !dbg !125
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_006_001_isr_1() #0 !dbg !126 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !127, metadata !DIExpression()), !dbg !128
  call void (...) @idlerun(), !dbg !129
  store volatile i32 0, i32* @svp_simple_006_001_global_var1, align 4, !dbg !130
  %2 = load volatile i32, i32* @svp_simple_006_001_global_var2, align 4, !dbg !131
  store i32 %2, i32* %1, align 4, !dbg !132
  ret void, !dbg !133
}

declare void @idlerun(...) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "flag", scope: !2, file: !8, line: 9, type: !13, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_006/svp_simple_006_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6, !11}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_006_001_global_var1", scope: !2, file: !8, line: 7, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_006/svp_simple_006_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "svp_simple_006_001_global_var2", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!13 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !14)
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{!"clang version 10.0.0 "}
!21 = distinct !DISubprogram(name: "svp_simple_006_001_main", scope: !8, file: !8, line: 10, type: !22, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocation(line: 12, column: 3, scope: !21)
!25 = !DILocalVariable(name: "reader1", scope: !21, file: !8, line: 13, type: !10)
!26 = !DILocation(line: 13, column: 7, scope: !21)
!27 = !DILocalVariable(name: "reader2", scope: !21, file: !8, line: 13, type: !10)
!28 = !DILocation(line: 13, column: 16, scope: !21)
!29 = !DILocalVariable(name: "i", scope: !30, file: !8, line: 15, type: !10)
!30 = distinct !DILexicalBlock(scope: !21, file: !8, line: 15, column: 3)
!31 = !DILocation(line: 15, column: 12, scope: !30)
!32 = !DILocation(line: 15, column: 8, scope: !30)
!33 = !DILocation(line: 15, column: 19, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !8, line: 15, column: 3)
!35 = !DILocation(line: 15, column: 21, scope: !34)
!36 = !DILocation(line: 15, column: 3, scope: !30)
!37 = !DILocalVariable(name: "j", scope: !38, file: !8, line: 17, type: !10)
!38 = distinct !DILexicalBlock(scope: !39, file: !8, line: 17, column: 5)
!39 = distinct !DILexicalBlock(scope: !34, file: !8, line: 16, column: 3)
!40 = !DILocation(line: 17, column: 14, scope: !38)
!41 = !DILocation(line: 17, column: 10, scope: !38)
!42 = !DILocation(line: 17, column: 21, scope: !43)
!43 = distinct !DILexicalBlock(scope: !38, file: !8, line: 17, column: 5)
!44 = !DILocation(line: 17, column: 23, scope: !43)
!45 = !DILocation(line: 17, column: 5, scope: !38)
!46 = !DILocation(line: 19, column: 11, scope: !47)
!47 = distinct !DILexicalBlock(scope: !48, file: !8, line: 19, column: 11)
!48 = distinct !DILexicalBlock(scope: !43, file: !8, line: 18, column: 5)
!49 = !DILocation(line: 19, column: 16, scope: !47)
!50 = !DILocation(line: 19, column: 13, scope: !47)
!51 = !DILocation(line: 19, column: 11, scope: !48)
!52 = !DILocation(line: 21, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !54, file: !8, line: 21, column: 13)
!54 = distinct !DILexicalBlock(scope: !47, file: !8, line: 20, column: 7)
!55 = !DILocation(line: 21, column: 15, scope: !53)
!56 = !DILocation(line: 21, column: 13, scope: !54)
!57 = !DILocation(line: 22, column: 21, scope: !53)
!58 = !DILocation(line: 22, column: 19, scope: !53)
!59 = !DILocation(line: 22, column: 11, scope: !53)
!60 = !DILocation(line: 23, column: 18, scope: !61)
!61 = distinct !DILexicalBlock(scope: !53, file: !8, line: 23, column: 18)
!62 = !DILocation(line: 23, column: 20, scope: !61)
!63 = !DILocation(line: 23, column: 18, scope: !53)
!64 = !DILocation(line: 24, column: 21, scope: !61)
!65 = !DILocation(line: 24, column: 19, scope: !61)
!66 = !DILocation(line: 24, column: 11, scope: !61)
!67 = !DILocation(line: 25, column: 18, scope: !68)
!68 = distinct !DILexicalBlock(scope: !61, file: !8, line: 25, column: 18)
!69 = !DILocation(line: 25, column: 20, scope: !68)
!70 = !DILocation(line: 25, column: 18, scope: !61)
!71 = !DILocation(line: 26, column: 21, scope: !68)
!72 = !DILocation(line: 26, column: 19, scope: !68)
!73 = !DILocation(line: 26, column: 11, scope: !68)
!74 = !DILocation(line: 27, column: 7, scope: !54)
!75 = !DILocation(line: 28, column: 5, scope: !48)
!76 = !DILocation(line: 17, column: 29, scope: !43)
!77 = !DILocation(line: 17, column: 5, scope: !43)
!78 = distinct !{!78, !45, !79}
!79 = !DILocation(line: 28, column: 5, scope: !38)
!80 = !DILocation(line: 29, column: 3, scope: !39)
!81 = !DILocation(line: 15, column: 27, scope: !34)
!82 = !DILocation(line: 15, column: 3, scope: !34)
!83 = distinct !{!83, !36, !84}
!84 = !DILocation(line: 29, column: 3, scope: !30)
!85 = !DILocalVariable(name: "i", scope: !86, file: !8, line: 31, type: !10)
!86 = distinct !DILexicalBlock(scope: !21, file: !8, line: 31, column: 3)
!87 = !DILocation(line: 31, column: 12, scope: !86)
!88 = !DILocation(line: 31, column: 8, scope: !86)
!89 = !DILocation(line: 31, column: 19, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !8, line: 31, column: 3)
!91 = !DILocation(line: 31, column: 21, scope: !90)
!92 = !DILocation(line: 31, column: 3, scope: !86)
!93 = !DILocalVariable(name: "j", scope: !94, file: !8, line: 33, type: !10)
!94 = distinct !DILexicalBlock(scope: !95, file: !8, line: 33, column: 5)
!95 = distinct !DILexicalBlock(scope: !90, file: !8, line: 32, column: 3)
!96 = !DILocation(line: 33, column: 14, scope: !94)
!97 = !DILocation(line: 33, column: 10, scope: !94)
!98 = !DILocation(line: 33, column: 21, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !8, line: 33, column: 5)
!100 = !DILocation(line: 33, column: 23, scope: !99)
!101 = !DILocation(line: 33, column: 5, scope: !94)
!102 = !DILocation(line: 35, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !104, file: !8, line: 35, column: 11)
!104 = distinct !DILexicalBlock(scope: !99, file: !8, line: 34, column: 5)
!105 = !DILocation(line: 35, column: 17, scope: !103)
!106 = !DILocation(line: 35, column: 15, scope: !103)
!107 = !DILocation(line: 35, column: 20, scope: !103)
!108 = !DILocation(line: 35, column: 26, scope: !103)
!109 = !DILocation(line: 35, column: 30, scope: !103)
!110 = !DILocation(line: 35, column: 34, scope: !103)
!111 = !DILocation(line: 35, column: 32, scope: !103)
!112 = !DILocation(line: 35, column: 11, scope: !104)
!113 = !DILocation(line: 36, column: 40, scope: !103)
!114 = !DILocation(line: 36, column: 9, scope: !103)
!115 = !DILocation(line: 37, column: 5, scope: !104)
!116 = !DILocation(line: 33, column: 29, scope: !99)
!117 = !DILocation(line: 33, column: 5, scope: !99)
!118 = distinct !{!118, !101, !119}
!119 = !DILocation(line: 37, column: 5, scope: !94)
!120 = !DILocation(line: 38, column: 3, scope: !95)
!121 = !DILocation(line: 31, column: 27, scope: !90)
!122 = !DILocation(line: 31, column: 3, scope: !90)
!123 = distinct !{!123, !92, !124}
!124 = !DILocation(line: 38, column: 3, scope: !86)
!125 = !DILocation(line: 39, column: 1, scope: !21)
!126 = distinct !DISubprogram(name: "svp_simple_006_001_isr_1", scope: !8, file: !8, line: 41, type: !22, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!127 = !DILocalVariable(name: "reader2", scope: !126, file: !8, line: 43, type: !10)
!128 = !DILocation(line: 43, column: 7, scope: !126)
!129 = !DILocation(line: 44, column: 3, scope: !126)
!130 = !DILocation(line: 46, column: 34, scope: !126)
!131 = !DILocation(line: 47, column: 13, scope: !126)
!132 = !DILocation(line: 47, column: 11, scope: !126)
!133 = !DILocation(line: 48, column: 1, scope: !126)
