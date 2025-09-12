; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_009/svp_simple_009_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_009/svp_simple_009_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_009_001_p = common global i32* null, align 8, !dbg !0
@svp_simple_009_001_q = common global i32* null, align 8, !dbg !6
@svp_simple_009_001_m = common global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_009_001_main() #0 !dbg !20 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void (...) @init(), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %1, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 1, i32* %1, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata i32* %2, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 9, i32* %2, align 4, !dbg !27
  store i32* %1, i32** @svp_simple_009_001_p, align 8, !dbg !28
  store i32* %1, i32** @svp_simple_009_001_q, align 8, !dbg !29
  %3 = load i32*, i32** @svp_simple_009_001_p, align 8, !dbg !30
  store volatile i32 2, i32* %3, align 4, !dbg !31
  %4 = load i32*, i32** @svp_simple_009_001_q, align 8, !dbg !32
  store volatile i32 3, i32* %4, align 4, !dbg !33
  store i32* %2, i32** @svp_simple_009_001_m, align 8, !dbg !34
  %5 = load i32*, i32** @svp_simple_009_001_m, align 8, !dbg !35
  store volatile i32 6, i32* %5, align 4, !dbg !36
  %6 = load i32*, i32** @svp_simple_009_001_m, align 8, !dbg !37
  store volatile i32 6, i32* %6, align 4, !dbg !38
  ret void, !dbg !39
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_009_001_isr_1() #0 !dbg !40 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %2, metadata !43, metadata !DIExpression()), !dbg !44
  call void (...) @idlerun(), !dbg !45
  %4 = load i32*, i32** @svp_simple_009_001_p, align 8, !dbg !46
  %5 = load volatile i32, i32* %4, align 4, !dbg !47
  store i32 %5, i32* %1, align 4, !dbg !48
  call void @llvm.dbg.declare(metadata i32* %3, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 8, i32* %3, align 4, !dbg !50
  store i32* %3, i32** @svp_simple_009_001_m, align 8, !dbg !51
  %6 = load i32*, i32** @svp_simple_009_001_m, align 8, !dbg !52
  %7 = load volatile i32, i32* %6, align 4, !dbg !53
  store i32 %7, i32* %2, align 4, !dbg !54
  ret void, !dbg !55
}

declare void @idlerun(...) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_009_001_p", scope: !2, file: !8, line: 4, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_009/svp_simple_009_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6, !12}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_009_001_q", scope: !2, file: !8, line: 5, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_009/svp_simple_009_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !11)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "svp_simple_009_001_m", scope: !2, file: !8, line: 7, type: !9, isLocal: false, isDefinition: true)
!14 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{!"clang version 10.0.0 "}
!20 = distinct !DISubprogram(name: "svp_simple_009_001_main", scope: !8, file: !8, line: 9, type: !21, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocation(line: 10, column: 3, scope: !20)
!24 = !DILocalVariable(name: "svp_simple_009_001_local_var1", scope: !20, file: !8, line: 11, type: !11)
!25 = !DILocation(line: 11, column: 7, scope: !20)
!26 = !DILocalVariable(name: "svp_simple_009_001_local_var2", scope: !20, file: !8, line: 12, type: !11)
!27 = !DILocation(line: 12, column: 7, scope: !20)
!28 = !DILocation(line: 14, column: 24, scope: !20)
!29 = !DILocation(line: 15, column: 24, scope: !20)
!30 = !DILocation(line: 17, column: 4, scope: !20)
!31 = !DILocation(line: 17, column: 25, scope: !20)
!32 = !DILocation(line: 18, column: 4, scope: !20)
!33 = !DILocation(line: 18, column: 25, scope: !20)
!34 = !DILocation(line: 20, column: 24, scope: !20)
!35 = !DILocation(line: 22, column: 4, scope: !20)
!36 = !DILocation(line: 22, column: 25, scope: !20)
!37 = !DILocation(line: 23, column: 4, scope: !20)
!38 = !DILocation(line: 23, column: 25, scope: !20)
!39 = !DILocation(line: 24, column: 1, scope: !20)
!40 = distinct !DISubprogram(name: "svp_simple_009_001_isr_1", scope: !8, file: !8, line: 26, type: !21, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DILocalVariable(name: "reader1", scope: !40, file: !8, line: 27, type: !11)
!42 = !DILocation(line: 27, column: 7, scope: !40)
!43 = !DILocalVariable(name: "reader2", scope: !40, file: !8, line: 27, type: !11)
!44 = !DILocation(line: 27, column: 16, scope: !40)
!45 = !DILocation(line: 28, column: 3, scope: !40)
!46 = !DILocation(line: 29, column: 14, scope: !40)
!47 = !DILocation(line: 29, column: 13, scope: !40)
!48 = !DILocation(line: 29, column: 11, scope: !40)
!49 = !DILocalVariable(name: "svp_simple_009_001_local_var3", scope: !40, file: !8, line: 30, type: !11)
!50 = !DILocation(line: 30, column: 7, scope: !40)
!51 = !DILocation(line: 31, column: 24, scope: !40)
!52 = !DILocation(line: 32, column: 14, scope: !40)
!53 = !DILocation(line: 32, column: 13, scope: !40)
!54 = !DILocation(line: 32, column: 11, scope: !40)
!55 = !DILocation(line: 33, column: 1, scope: !40)
