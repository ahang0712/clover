; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_020/svp_simple_020_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_020/svp_simple_020_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_020_001_global_flag = global i32 0, align 4, !dbg !0
@svp_simple_020_001_global_para = common global i32 0, align 4, !dbg !11
@svp_simple_020_001_global_var = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_020_001_main() #0 !dbg !19 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void (...) @init(), !dbg !22
  call void @disable_isr(i32 2), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %1, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %2, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %3, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %4, metadata !30, metadata !DIExpression()), !dbg !31
  %5 = call i32 (...) @rand(), !dbg !32
  store i32 %5, i32* %3, align 4, !dbg !33
  %6 = call i32 (...) @rand(), !dbg !34
  store i32 %6, i32* %4, align 4, !dbg !35
  %7 = load i32, i32* %3, align 4, !dbg !36
  %8 = load i32, i32* %4, align 4, !dbg !38
  %9 = add nsw i32 %7, %8, !dbg !39
  %10 = load volatile i32, i32* @svp_simple_020_001_global_para, align 4, !dbg !40
  %11 = icmp sgt i32 %9, %10, !dbg !41
  br i1 %11, label %12, label %14, !dbg !42

12:                                               ; preds = %0
  %13 = load volatile i32, i32* @svp_simple_020_001_global_var, align 4, !dbg !43
  store i32 %13, i32* %1, align 4, !dbg !44
  br label %14, !dbg !45

14:                                               ; preds = %12, %0
  %15 = load i32, i32* %3, align 4, !dbg !46
  %16 = load i32, i32* %4, align 4, !dbg !48
  %17 = add nsw i32 %15, %16, !dbg !49
  %18 = load volatile i32, i32* @svp_simple_020_001_global_para, align 4, !dbg !50
  %19 = icmp slt i32 %17, %18, !dbg !51
  br i1 %19, label %20, label %22, !dbg !52

20:                                               ; preds = %14
  %21 = load volatile i32, i32* @svp_simple_020_001_global_var, align 4, !dbg !53
  store i32 %21, i32* %2, align 4, !dbg !54
  br label %22, !dbg !55

22:                                               ; preds = %20, %14
  ret void, !dbg !56
}

declare void @init(...) #1

declare void @disable_isr(i32) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @rand(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_020_001_isr_1() #0 !dbg !57 {
  store volatile i32 1, i32* @svp_simple_020_001_global_var, align 4, !dbg !58
  store volatile i32 1, i32* @svp_simple_020_001_global_flag, align 4, !dbg !59
  call void @enable_isr(i32 2), !dbg !60
  ret void, !dbg !61
}

declare void @enable_isr(i32) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_020_001_isr_2() #0 !dbg !62 {
  %1 = load volatile i32, i32* @svp_simple_020_001_global_flag, align 4, !dbg !63
  %2 = icmp eq i32 %1, 1, !dbg !65
  br i1 %2, label %3, label %4, !dbg !66

3:                                                ; preds = %0
  store volatile i32 11, i32* @svp_simple_020_001_global_para, align 4, !dbg !67
  store volatile i32 5, i32* @svp_simple_020_001_global_var, align 4, !dbg !69
  br label %4, !dbg !70

4:                                                ; preds = %3, %0
  ret void, !dbg !71
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_020_001_global_flag", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_020/svp_simple_020_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6, !11}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_020_001_global_var", scope: !2, file: !8, line: 4, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_020/svp_simple_020_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "svp_simple_020_001_global_para", scope: !2, file: !8, line: 6, type: !9, isLocal: false, isDefinition: true)
!13 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"PIC Level", i32 2}
!18 = !{!"clang version 10.0.0 "}
!19 = distinct !DISubprogram(name: "svp_simple_020_001_main", scope: !8, file: !8, line: 10, type: !20, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocation(line: 11, column: 3, scope: !19)
!23 = !DILocation(line: 12, column: 3, scope: !19)
!24 = !DILocalVariable(name: "reader1", scope: !19, file: !8, line: 13, type: !10)
!25 = !DILocation(line: 13, column: 7, scope: !19)
!26 = !DILocalVariable(name: "reader2", scope: !19, file: !8, line: 13, type: !10)
!27 = !DILocation(line: 13, column: 16, scope: !19)
!28 = !DILocalVariable(name: "svp_simple_020_001_local_var1", scope: !19, file: !8, line: 14, type: !10)
!29 = !DILocation(line: 14, column: 7, scope: !19)
!30 = !DILocalVariable(name: "svp_simple_020_001_local_var2", scope: !19, file: !8, line: 14, type: !10)
!31 = !DILocation(line: 14, column: 38, scope: !19)
!32 = !DILocation(line: 15, column: 35, scope: !19)
!33 = !DILocation(line: 15, column: 33, scope: !19)
!34 = !DILocation(line: 16, column: 35, scope: !19)
!35 = !DILocation(line: 16, column: 33, scope: !19)
!36 = !DILocation(line: 21, column: 7, scope: !37)
!37 = distinct !DILexicalBlock(scope: !19, file: !8, line: 21, column: 7)
!38 = !DILocation(line: 21, column: 39, scope: !37)
!39 = !DILocation(line: 21, column: 37, scope: !37)
!40 = !DILocation(line: 21, column: 71, scope: !37)
!41 = !DILocation(line: 21, column: 69, scope: !37)
!42 = !DILocation(line: 21, column: 7, scope: !19)
!43 = !DILocation(line: 22, column: 15, scope: !37)
!44 = !DILocation(line: 22, column: 13, scope: !37)
!45 = !DILocation(line: 22, column: 5, scope: !37)
!46 = !DILocation(line: 24, column: 7, scope: !47)
!47 = distinct !DILexicalBlock(scope: !19, file: !8, line: 24, column: 7)
!48 = !DILocation(line: 24, column: 39, scope: !47)
!49 = !DILocation(line: 24, column: 37, scope: !47)
!50 = !DILocation(line: 24, column: 71, scope: !47)
!51 = !DILocation(line: 24, column: 69, scope: !47)
!52 = !DILocation(line: 24, column: 7, scope: !19)
!53 = !DILocation(line: 25, column: 15, scope: !47)
!54 = !DILocation(line: 25, column: 13, scope: !47)
!55 = !DILocation(line: 25, column: 5, scope: !47)
!56 = !DILocation(line: 26, column: 1, scope: !19)
!57 = distinct !DISubprogram(name: "svp_simple_020_001_isr_1", scope: !8, file: !8, line: 28, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 29, column: 33, scope: !57)
!59 = !DILocation(line: 31, column: 34, scope: !57)
!60 = !DILocation(line: 32, column: 3, scope: !57)
!61 = !DILocation(line: 33, column: 1, scope: !57)
!62 = distinct !DISubprogram(name: "svp_simple_020_001_isr_2", scope: !8, file: !8, line: 35, type: !20, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DILocation(line: 36, column: 7, scope: !64)
!64 = distinct !DILexicalBlock(scope: !62, file: !8, line: 36, column: 7)
!65 = !DILocation(line: 36, column: 38, scope: !64)
!66 = !DILocation(line: 36, column: 7, scope: !62)
!67 = !DILocation(line: 37, column: 36, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !8, line: 36, column: 44)
!69 = !DILocation(line: 38, column: 35, scope: !68)
!70 = !DILocation(line: 39, column: 3, scope: !68)
!71 = !DILocation(line: 40, column: 1, scope: !62)
