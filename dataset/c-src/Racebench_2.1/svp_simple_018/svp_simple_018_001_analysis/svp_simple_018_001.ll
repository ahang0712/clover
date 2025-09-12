; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_018/svp_simple_018_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_018/svp_simple_018_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_018_001_para1 = common global float 0.000000e+00, align 4, !dbg !0
@svp_simple_018_001_para2 = common global float 0.000000e+00, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_018_001_main() #0 !dbg !17 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  call void @enable_isr(i32 1), !dbg !20
  call void @enable_isr(i32 2), !dbg !21
  call void @llvm.dbg.declare(metadata float* %1, metadata !22, metadata !DIExpression()), !dbg !23
  store float 0.000000e+00, float* %1, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata float* %2, metadata !24, metadata !DIExpression()), !dbg !25
  store float 0.000000e+00, float* %2, align 4, !dbg !25
  %3 = call float @svp_simple_018_001_func1(), !dbg !26
  store float %3, float* %1, align 4, !dbg !27
  %4 = call float @svp_simple_018_001_func2(), !dbg !28
  store float %4, float* %2, align 4, !dbg !29
  ret void, !dbg !30
}

declare void @enable_isr(i32) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define float @svp_simple_018_001_func1() #0 !dbg !31 {
  %1 = alloca float, align 4
  call void @llvm.dbg.declare(metadata float* %1, metadata !34, metadata !DIExpression()), !dbg !35
  store float 0.000000e+00, float* %1, align 4, !dbg !35
  %2 = load volatile float, float* @svp_simple_018_001_para1, align 4, !dbg !36
  %3 = fmul float 2.000000e+00, %2, !dbg !37
  %4 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !38
  %5 = fmul float %3, %4, !dbg !39
  store float %5, float* %1, align 4, !dbg !40
  %6 = load float, float* %1, align 4, !dbg !41
  ret float %6, !dbg !42
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define float @svp_simple_018_001_func2() #0 !dbg !43 {
  %1 = alloca float, align 4
  call void @llvm.dbg.declare(metadata float* %1, metadata !44, metadata !DIExpression()), !dbg !45
  store float 0.000000e+00, float* %1, align 4, !dbg !45
  %2 = load volatile float, float* @svp_simple_018_001_para1, align 4, !dbg !46
  %3 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !47
  %4 = fmul float %2, %3, !dbg !48
  %5 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !49
  %6 = fmul float %4, %5, !dbg !50
  store float %6, float* %1, align 4, !dbg !51
  %7 = load float, float* %1, align 4, !dbg !52
  ret float %7, !dbg !53
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_018_001_isr_func1() #0 !dbg !54 {
  store volatile float 1.000000e+00, float* @svp_simple_018_001_para2, align 4, !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_018_001_isr_1() #0 !dbg !57 {
  call void (...) @idlerun(), !dbg !58
  store volatile float 2.000000e+00, float* @svp_simple_018_001_para1, align 4, !dbg !59
  ret void, !dbg !60
}

declare void @idlerun(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_018_001_isr_2() #0 !dbg !61 {
  call void (...) @idlerun(), !dbg !62
  call void @svp_simple_018_001_isr_func1(), !dbg !63
  ret void, !dbg !64
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_018_001_para1", scope: !2, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_018/svp_simple_018_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_018_001_para2", scope: !2, file: !8, line: 13, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_018/svp_simple_018_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!11 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{!"clang version 10.0.0 "}
!17 = distinct !DISubprogram(name: "svp_simple_018_001_main", scope: !8, file: !8, line: 15, type: !18, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocation(line: 17, column: 3, scope: !17)
!21 = !DILocation(line: 18, column: 3, scope: !17)
!22 = !DILocalVariable(name: "svp_simple_018_001_perimete", scope: !17, file: !8, line: 19, type: !10)
!23 = !DILocation(line: 19, column: 9, scope: !17)
!24 = !DILocalVariable(name: "svp_simple_018_001_area", scope: !17, file: !8, line: 20, type: !10)
!25 = !DILocation(line: 20, column: 9, scope: !17)
!26 = !DILocation(line: 21, column: 33, scope: !17)
!27 = !DILocation(line: 21, column: 31, scope: !17)
!28 = !DILocation(line: 22, column: 29, scope: !17)
!29 = !DILocation(line: 22, column: 27, scope: !17)
!30 = !DILocation(line: 23, column: 1, scope: !17)
!31 = distinct !DISubprogram(name: "svp_simple_018_001_func1", scope: !8, file: !8, line: 25, type: !32, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!32 = !DISubroutineType(types: !33)
!33 = !{!10}
!34 = !DILocalVariable(name: "perimete", scope: !31, file: !8, line: 26, type: !10)
!35 = !DILocation(line: 26, column: 9, scope: !31)
!36 = !DILocation(line: 27, column: 18, scope: !31)
!37 = !DILocation(line: 27, column: 16, scope: !31)
!38 = !DILocation(line: 28, column: 14, scope: !31)
!39 = !DILocation(line: 27, column: 43, scope: !31)
!40 = !DILocation(line: 27, column: 12, scope: !31)
!41 = !DILocation(line: 29, column: 10, scope: !31)
!42 = !DILocation(line: 29, column: 3, scope: !31)
!43 = distinct !DISubprogram(name: "svp_simple_018_001_func2", scope: !8, file: !8, line: 32, type: !32, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DILocalVariable(name: "area", scope: !43, file: !8, line: 33, type: !10)
!45 = !DILocation(line: 33, column: 9, scope: !43)
!46 = !DILocation(line: 34, column: 10, scope: !43)
!47 = !DILocation(line: 35, column: 10, scope: !43)
!48 = !DILocation(line: 34, column: 35, scope: !43)
!49 = !DILocation(line: 36, column: 10, scope: !43)
!50 = !DILocation(line: 35, column: 35, scope: !43)
!51 = !DILocation(line: 34, column: 8, scope: !43)
!52 = !DILocation(line: 37, column: 10, scope: !43)
!53 = !DILocation(line: 37, column: 3, scope: !43)
!54 = distinct !DISubprogram(name: "svp_simple_018_001_isr_func1", scope: !8, file: !8, line: 40, type: !18, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocation(line: 41, column: 28, scope: !54)
!56 = !DILocation(line: 42, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "svp_simple_018_001_isr_1", scope: !8, file: !8, line: 44, type: !18, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 45, column: 3, scope: !57)
!59 = !DILocation(line: 46, column: 28, scope: !57)
!60 = !DILocation(line: 47, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "svp_simple_018_001_isr_2", scope: !8, file: !8, line: 49, type: !18, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocation(line: 50, column: 3, scope: !61)
!63 = !DILocation(line: 51, column: 3, scope: !61)
!64 = !DILocation(line: 52, column: 1, scope: !61)
