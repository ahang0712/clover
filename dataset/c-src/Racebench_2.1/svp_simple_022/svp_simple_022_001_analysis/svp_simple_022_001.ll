; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_022/svp_simple_022_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_022/svp_simple_022_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_022_001_global_var1 = common global i32 0, align 4, !dbg !0
@svp_simple_022_001_global_array = common global [256 x i32] zeroinitializer, align 16, !dbg !13
@svp_simple_022_001_global_var3 = common global i32 0, align 4, !dbg !11
@svp_simple_022_001_global_var2 = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_022_001_main() #0 !dbg !24 {
  %1 = alloca i32, align 4
  call void @svp_simple_022_001_init(), !dbg !27
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !28
  call void @svp_simple_022_001_func_3(), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %1, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %1, align 4, !dbg !32
  br label %2, !dbg !34

2:                                                ; preds = %9, %0
  %3 = load i32, i32* %1, align 4, !dbg !35
  %4 = icmp slt i32 %3, 256, !dbg !37
  br i1 %4, label %5, label %12, !dbg !38

5:                                                ; preds = %2
  %6 = load i32, i32* %1, align 4, !dbg !39
  %7 = sext i32 %6 to i64, !dbg !41
  %8 = getelementptr inbounds [256 x i32], [256 x i32]* @svp_simple_022_001_global_array, i64 0, i64 %7, !dbg !41
  store volatile i32 0, i32* %8, align 4, !dbg !42
  br label %9, !dbg !43

9:                                                ; preds = %5
  %10 = load i32, i32* %1, align 4, !dbg !44
  %11 = add nsw i32 %10, 1, !dbg !44
  store i32 %11, i32* %1, align 4, !dbg !44
  br label %2, !dbg !45, !llvm.loop !46

12:                                               ; preds = %2
  call void @svp_simple_022_001_func_4(), !dbg !48
  %13 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !49
  store volatile i32 %13, i32* @svp_simple_022_001_global_var3, align 4, !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_022_001_init() #0 !dbg !52 {
  call void @disable_isr(i32 -1), !dbg !53
  call void (...) @init(), !dbg !54
  call void @enable_isr(i32 -1), !dbg !55
  ret void, !dbg !56
}

declare void @disable_isr(i32) #2

declare void @init(...) #2

declare void @enable_isr(i32) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_022_001_func_1() #0 !dbg !57 {
  call void @svp_simple_022_001_func_3(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_022_001_func_2() #0 !dbg !60 {
  call void @svp_simple_022_001_func_4(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_022_001_func_3() #0 !dbg !63 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !64
  %2 = icmp sge i32 %1, 12, !dbg !66
  br i1 %2, label %3, label %4, !dbg !67

3:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !68
  br label %5, !dbg !70

4:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !71
  br label %5

5:                                                ; preds = %4, %3
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_022_001_func_4() #0 !dbg !74 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !75
  store volatile i32 %1, i32* @svp_simple_022_001_global_var3, align 4, !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_022_001_isr_1() #0 !dbg !78 {
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !79
  ret void, !dbg !80
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_022_001_global_var1", scope: !2, file: !8, line: 4, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_022/svp_simple_022_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6, !11, !13}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_022_001_global_var2", scope: !2, file: !8, line: 5, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_022/svp_simple_022_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "svp_simple_022_001_global_var3", scope: !2, file: !8, line: 6, type: !9, isLocal: false, isDefinition: true)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "svp_simple_022_001_global_array", scope: !2, file: !8, line: 7, type: !15, isLocal: false, isDefinition: true)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 8192, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 256)
!18 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"PIC Level", i32 2}
!23 = !{!"clang version 10.0.0 "}
!24 = distinct !DISubprogram(name: "svp_simple_022_001_main", scope: !8, file: !8, line: 14, type: !25, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocation(line: 15, column: 3, scope: !24)
!28 = !DILocation(line: 17, column: 34, scope: !24)
!29 = !DILocation(line: 18, column: 3, scope: !24)
!30 = !DILocalVariable(name: "i", scope: !24, file: !8, line: 19, type: !10)
!31 = !DILocation(line: 19, column: 7, scope: !24)
!32 = !DILocation(line: 20, column: 10, scope: !33)
!33 = distinct !DILexicalBlock(scope: !24, file: !8, line: 20, column: 3)
!34 = !DILocation(line: 20, column: 8, scope: !33)
!35 = !DILocation(line: 20, column: 15, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !8, line: 20, column: 3)
!37 = !DILocation(line: 20, column: 17, scope: !36)
!38 = !DILocation(line: 20, column: 3, scope: !33)
!39 = !DILocation(line: 21, column: 37, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !8, line: 20, column: 29)
!41 = !DILocation(line: 21, column: 5, scope: !40)
!42 = !DILocation(line: 21, column: 40, scope: !40)
!43 = !DILocation(line: 22, column: 3, scope: !40)
!44 = !DILocation(line: 20, column: 25, scope: !36)
!45 = !DILocation(line: 20, column: 3, scope: !36)
!46 = distinct !{!46, !38, !47}
!47 = !DILocation(line: 22, column: 3, scope: !33)
!48 = !DILocation(line: 23, column: 3, scope: !24)
!49 = !DILocation(line: 24, column: 36, scope: !24)
!50 = !DILocation(line: 24, column: 34, scope: !24)
!51 = !DILocation(line: 25, column: 1, scope: !24)
!52 = distinct !DISubprogram(name: "svp_simple_022_001_init", scope: !8, file: !8, line: 27, type: !25, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DILocation(line: 28, column: 3, scope: !52)
!54 = !DILocation(line: 33, column: 3, scope: !52)
!55 = !DILocation(line: 34, column: 3, scope: !52)
!56 = !DILocation(line: 35, column: 1, scope: !52)
!57 = distinct !DISubprogram(name: "svp_simple_022_001_func_1", scope: !8, file: !8, line: 37, type: !25, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 37, column: 36, scope: !57)
!59 = !DILocation(line: 37, column: 65, scope: !57)
!60 = distinct !DISubprogram(name: "svp_simple_022_001_func_2", scope: !8, file: !8, line: 39, type: !25, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocation(line: 39, column: 36, scope: !60)
!62 = !DILocation(line: 39, column: 65, scope: !60)
!63 = distinct !DISubprogram(name: "svp_simple_022_001_func_3", scope: !8, file: !8, line: 41, type: !25, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocation(line: 42, column: 7, scope: !65)
!65 = distinct !DILexicalBlock(scope: !63, file: !8, line: 42, column: 7)
!66 = !DILocation(line: 42, column: 38, scope: !65)
!67 = !DILocation(line: 42, column: 7, scope: !63)
!68 = !DILocation(line: 43, column: 36, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !8, line: 42, column: 45)
!70 = !DILocation(line: 44, column: 3, scope: !69)
!71 = !DILocation(line: 45, column: 36, scope: !72)
!72 = distinct !DILexicalBlock(scope: !65, file: !8, line: 44, column: 10)
!73 = !DILocation(line: 47, column: 1, scope: !63)
!74 = distinct !DISubprogram(name: "svp_simple_022_001_func_4", scope: !8, file: !8, line: 49, type: !25, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocation(line: 50, column: 36, scope: !74)
!76 = !DILocation(line: 50, column: 34, scope: !74)
!77 = !DILocation(line: 51, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "svp_simple_022_001_isr_1", scope: !8, file: !8, line: 52, type: !25, scopeLine: 52, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocation(line: 53, column: 34, scope: !78)
!80 = !DILocation(line: 54, column: 1, scope: !78)
