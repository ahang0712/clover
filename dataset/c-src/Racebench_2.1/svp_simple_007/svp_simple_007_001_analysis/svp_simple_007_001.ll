; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_007/svp_simple_007_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_007/svp_simple_007_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_007_001_global_var = global i32 0, align 4, !dbg !0
@svp_simple_007_001_global_array = common global [5 x i32] zeroinitializer, align 16, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_007_001_main() #0 !dbg !20 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  call void (...) @init(), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %1, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %2, metadata !26, metadata !DIExpression()), !dbg !27
  %4 = load volatile i32, i32* @svp_simple_007_001_global_var, align 4, !dbg !28
  %5 = sext i32 %4 to i64, !dbg !29
  %6 = getelementptr inbounds [5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 %5, !dbg !29
  store volatile i32 1, i32* %6, align 4, !dbg !30
  %7 = load volatile i32, i32* @svp_simple_007_001_global_var, align 4, !dbg !31
  %8 = sext i32 %7 to i64, !dbg !32
  %9 = getelementptr inbounds [5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 %8, !dbg !32
  %10 = load volatile i32, i32* %9, align 4, !dbg !32
  store i32 %10, i32* %2, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32* %3, metadata !34, metadata !DIExpression()), !dbg !35
  %11 = call i32 (...) @rand(), !dbg !36
  store i32 %11, i32* %3, align 4, !dbg !35
  %12 = load i32, i32* %3, align 4, !dbg !37
  %13 = icmp eq i32 %12, 2, !dbg !39
  br i1 %13, label %14, label %18, !dbg !40

14:                                               ; preds = %0
  %15 = load i32, i32* %3, align 4, !dbg !41
  %16 = sext i32 %15 to i64, !dbg !42
  %17 = getelementptr inbounds [5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 %16, !dbg !42
  store volatile i32 2, i32* %17, align 4, !dbg !43
  br label %22, !dbg !42

18:                                               ; preds = %0
  %19 = load i32, i32* %3, align 4, !dbg !44
  %20 = sext i32 %19 to i64, !dbg !45
  %21 = getelementptr inbounds [5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 %20, !dbg !45
  store volatile i32 9, i32* %21, align 4, !dbg !46
  br label %22

22:                                               ; preds = %18, %14
  %23 = load volatile i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 2), align 8, !dbg !47
  store i32 %23, i32* %1, align 4, !dbg !48
  ret void, !dbg !49
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @rand(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_007_001_isr_1() #0 !dbg !50 {
  call void (...) @idlerun(), !dbg !51
  store volatile i32 9, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 2), align 8, !dbg !52
  %1 = load volatile i32, i32* @svp_simple_007_001_global_var, align 4, !dbg !53
  %2 = add nsw i32 %1, 1, !dbg !53
  store volatile i32 %2, i32* @svp_simple_007_001_global_var, align 4, !dbg !53
  %3 = load volatile i32, i32* @svp_simple_007_001_global_var, align 4, !dbg !54
  %4 = sext i32 %3 to i64, !dbg !55
  %5 = getelementptr inbounds [5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 %4, !dbg !55
  store volatile i32 9, i32* %5, align 4, !dbg !56
  ret void, !dbg !57
}

declare void @idlerun(...) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_007_001_global_var", scope: !2, file: !8, line: 7, type: !10, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_007/svp_simple_007_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_007_001_global_array", scope: !2, file: !8, line: 9, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_007/svp_simple_007_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 160, elements: !12)
!10 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !11)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!13}
!13 = !DISubrange(count: 5)
!14 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{!"clang version 10.0.0 "}
!20 = distinct !DISubprogram(name: "svp_simple_007_001_main", scope: !8, file: !8, line: 11, type: !21, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocation(line: 12, column: 3, scope: !20)
!24 = !DILocalVariable(name: "reader1", scope: !20, file: !8, line: 13, type: !11)
!25 = !DILocation(line: 13, column: 7, scope: !20)
!26 = !DILocalVariable(name: "reader2", scope: !20, file: !8, line: 13, type: !11)
!27 = !DILocation(line: 13, column: 16, scope: !20)
!28 = !DILocation(line: 17, column: 35, scope: !20)
!29 = !DILocation(line: 17, column: 3, scope: !20)
!30 = !DILocation(line: 17, column: 66, scope: !20)
!31 = !DILocation(line: 19, column: 45, scope: !20)
!32 = !DILocation(line: 19, column: 13, scope: !20)
!33 = !DILocation(line: 19, column: 11, scope: !20)
!34 = !DILocalVariable(name: "i", scope: !20, file: !8, line: 21, type: !11)
!35 = !DILocation(line: 21, column: 7, scope: !20)
!36 = !DILocation(line: 21, column: 11, scope: !20)
!37 = !DILocation(line: 22, column: 7, scope: !38)
!38 = distinct !DILexicalBlock(scope: !20, file: !8, line: 22, column: 7)
!39 = !DILocation(line: 22, column: 9, scope: !38)
!40 = !DILocation(line: 22, column: 7, scope: !20)
!41 = !DILocation(line: 23, column: 37, scope: !38)
!42 = !DILocation(line: 23, column: 5, scope: !38)
!43 = !DILocation(line: 23, column: 40, scope: !38)
!44 = !DILocation(line: 25, column: 37, scope: !38)
!45 = !DILocation(line: 25, column: 5, scope: !38)
!46 = !DILocation(line: 25, column: 40, scope: !38)
!47 = !DILocation(line: 27, column: 13, scope: !20)
!48 = !DILocation(line: 27, column: 11, scope: !20)
!49 = !DILocation(line: 28, column: 1, scope: !20)
!50 = distinct !DISubprogram(name: "svp_simple_007_001_isr_1", scope: !8, file: !8, line: 30, type: !21, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DILocation(line: 31, column: 3, scope: !50)
!52 = !DILocation(line: 32, column: 38, scope: !50)
!53 = !DILocation(line: 34, column: 33, scope: !50)
!54 = !DILocation(line: 35, column: 35, scope: !50)
!55 = !DILocation(line: 35, column: 3, scope: !50)
!56 = !DILocation(line: 35, column: 66, scope: !50)
!57 = !DILocation(line: 36, column: 1, scope: !50)
