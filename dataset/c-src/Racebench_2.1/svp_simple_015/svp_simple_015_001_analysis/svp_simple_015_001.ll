; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_015/svp_simple_015_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_015/svp_simple_015_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_015_001_global_var1 = common global i32 0, align 4, !dbg !0
@svp_simple_015_001_global_var2 = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_015_001_main() #0 !dbg !17 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void (...) @init(), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %1, metadata !21, metadata !DIExpression()), !dbg !22
  %5 = call i32 (...) @rand(), !dbg !23
  store i32 %5, i32* %1, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %2, metadata !24, metadata !DIExpression()), !dbg !25
  %6 = call i32 (...) @rand(), !dbg !26
  store i32 %6, i32* %2, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata i32* %3, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %4, metadata !29, metadata !DIExpression()), !dbg !30
  %7 = call i32 (...) @rand(), !dbg !31
  store i32 %7, i32* %4, align 4, !dbg !30
  %8 = load volatile i32, i32* @svp_simple_015_001_global_var1, align 4, !dbg !32
  %9 = load i32, i32* %2, align 4, !dbg !34
  %10 = icmp slt i32 %8, %9, !dbg !35
  br i1 %10, label %11, label %19, !dbg !36

11:                                               ; preds = %0
  %12 = load volatile i32, i32* @svp_simple_015_001_global_var1, align 4, !dbg !37
  %13 = load i32, i32* %1, align 4, !dbg !38
  %14 = icmp sgt i32 %12, %13, !dbg !39
  br i1 %14, label %15, label %19, !dbg !40

15:                                               ; preds = %11
  %16 = load i32, i32* %1, align 4, !dbg !41
  %17 = load i32, i32* %2, align 4, !dbg !42
  %18 = add nsw i32 %16, %17, !dbg !43
  store i32 %18, i32* %3, align 4, !dbg !44
  br label %19, !dbg !45

19:                                               ; preds = %15, %11, %0
  %20 = load i32, i32* %4, align 4, !dbg !46
  %21 = icmp eq i32 %20, 1, !dbg !47
  br i1 %21, label %22, label %24, !dbg !46

22:                                               ; preds = %19
  %23 = load volatile i32, i32* @svp_simple_015_001_global_var2, align 4, !dbg !48
  br label %26, !dbg !46

24:                                               ; preds = %19
  %25 = load volatile i32, i32* @svp_simple_015_001_global_var2, align 4, !dbg !49
  br label %26, !dbg !46

26:                                               ; preds = %24, %22
  %27 = phi i32 [ %23, %22 ], [ %25, %24 ], !dbg !46
  ret void, !dbg !50
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @rand(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_015_001_isr_1() #0 !dbg !51 {
  call void (...) @idlerun(), !dbg !52
  store volatile i32 5, i32* @svp_simple_015_001_global_var1, align 4, !dbg !53
  store volatile i32 5, i32* @svp_simple_015_001_global_var2, align 4, !dbg !54
  ret void, !dbg !55
}

declare void @idlerun(...) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_015_001_global_var1", scope: !2, file: !8, line: 4, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_015/svp_simple_015_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_015_001_global_var2", scope: !2, file: !8, line: 5, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_015/svp_simple_015_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{!"clang version 10.0.0 "}
!17 = distinct !DISubprogram(name: "svp_simple_015_001_main", scope: !8, file: !8, line: 7, type: !18, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocation(line: 8, column: 3, scope: !17)
!21 = !DILocalVariable(name: "x", scope: !17, file: !8, line: 10, type: !10)
!22 = !DILocation(line: 10, column: 7, scope: !17)
!23 = !DILocation(line: 10, column: 11, scope: !17)
!24 = !DILocalVariable(name: "y", scope: !17, file: !8, line: 11, type: !10)
!25 = !DILocation(line: 11, column: 7, scope: !17)
!26 = !DILocation(line: 11, column: 11, scope: !17)
!27 = !DILocalVariable(name: "z", scope: !17, file: !8, line: 12, type: !10)
!28 = !DILocation(line: 12, column: 7, scope: !17)
!29 = !DILocalVariable(name: "p", scope: !17, file: !8, line: 13, type: !10)
!30 = !DILocation(line: 13, column: 7, scope: !17)
!31 = !DILocation(line: 13, column: 11, scope: !17)
!32 = !DILocation(line: 15, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !17, file: !8, line: 15, column: 7)
!34 = !DILocation(line: 15, column: 41, scope: !33)
!35 = !DILocation(line: 15, column: 39, scope: !33)
!36 = !DILocation(line: 15, column: 44, scope: !33)
!37 = !DILocation(line: 16, column: 8, scope: !33)
!38 = !DILocation(line: 16, column: 41, scope: !33)
!39 = !DILocation(line: 16, column: 39, scope: !33)
!40 = !DILocation(line: 15, column: 7, scope: !17)
!41 = !DILocation(line: 17, column: 9, scope: !33)
!42 = !DILocation(line: 17, column: 13, scope: !33)
!43 = !DILocation(line: 17, column: 11, scope: !33)
!44 = !DILocation(line: 17, column: 7, scope: !33)
!45 = !DILocation(line: 17, column: 5, scope: !33)
!46 = !DILocation(line: 19, column: 3, scope: !17)
!47 = !DILocation(line: 19, column: 5, scope: !17)
!48 = !DILocation(line: 19, column: 12, scope: !17)
!49 = !DILocation(line: 19, column: 45, scope: !17)
!50 = !DILocation(line: 20, column: 1, scope: !17)
!51 = distinct !DISubprogram(name: "svp_simple_015_001_isr_1", scope: !8, file: !8, line: 22, type: !18, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DILocation(line: 23, column: 3, scope: !51)
!53 = !DILocation(line: 24, column: 34, scope: !51)
!54 = !DILocation(line: 25, column: 34, scope: !51)
!55 = !DILocation(line: 26, column: 1, scope: !51)
