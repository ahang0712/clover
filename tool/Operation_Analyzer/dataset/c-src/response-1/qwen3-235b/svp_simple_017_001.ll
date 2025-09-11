; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_017/svp_simple_017_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_017/svp_simple_017_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_017_001_global_var = common global i32 0, align 4, !dbg !0
@svp_simple_017_001_local_array = common global [100 x i32] zeroinitializer, align 16, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_017_001_main() #0 !dbg !19 {
  %1 = alloca i32, align 4
  call void (...) @init(), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %1, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 0, i32* %1, align 4, !dbg !24
  store volatile i32 0, i32* @svp_simple_017_001_global_var, align 4, !dbg !25
  br label %2, !dbg !27

2:                                                ; preds = %11, %0
  %3 = load volatile i32, i32* @svp_simple_017_001_global_var, align 4, !dbg !28
  %4 = icmp slt i32 %3, 100, !dbg !30
  br i1 %4, label %5, label %14, !dbg !31

5:                                                ; preds = %2
  %6 = load i32, i32* %1, align 4, !dbg !32
  %7 = add nsw i32 %6, 1, !dbg !32
  store i32 %7, i32* %1, align 4, !dbg !32
  %8 = load volatile i32, i32* @svp_simple_017_001_global_var, align 4, !dbg !34
  %9 = sext i32 %8 to i64, !dbg !35
  %10 = getelementptr inbounds [100 x i32], [100 x i32]* @svp_simple_017_001_local_array, i64 0, i64 %9, !dbg !35
  store volatile i32 %6, i32* %10, align 4, !dbg !36
  br label %11, !dbg !37

11:                                               ; preds = %5
  %12 = load volatile i32, i32* @svp_simple_017_001_global_var, align 4, !dbg !38
  %13 = add nsw i32 %12, 1, !dbg !38
  store volatile i32 %13, i32* @svp_simple_017_001_global_var, align 4, !dbg !38
  br label %2, !dbg !39, !llvm.loop !40

14:                                               ; preds = %2
  ret void, !dbg !42
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_017_001_isr_1() #0 !dbg !43 {
  call void (...) @idlerun(), !dbg !44
  store volatile i32 50, i32* @svp_simple_017_001_global_var, align 4, !dbg !45
  %1 = load volatile i32, i32* @svp_simple_017_001_global_var, align 4, !dbg !46
  %2 = sext i32 %1 to i64, !dbg !47
  %3 = getelementptr inbounds [100 x i32], [100 x i32]* @svp_simple_017_001_local_array, i64 0, i64 %2, !dbg !47
  store volatile i32 0, i32* %3, align 4, !dbg !48
  ret void, !dbg !49
}

declare void @idlerun(...) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_017_001_global_var", scope: !2, file: !8, line: 7, type: !10, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_017/svp_simple_017_001.c", directory: "/Users/hehang03/code/clover/tool/Operation_Analyzer")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_017_001_local_array", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_017/svp_simple_017_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 3200, elements: !12)
!10 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !11)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!13}
!13 = !DISubrange(count: 100)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"PIC Level", i32 2}
!18 = !{!"clang version 10.0.0 "}
!19 = distinct !DISubprogram(name: "svp_simple_017_001_main", scope: !8, file: !8, line: 10, type: !20, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocation(line: 11, column: 3, scope: !19)
!23 = !DILocalVariable(name: "i", scope: !19, file: !8, line: 12, type: !11)
!24 = !DILocation(line: 12, column: 7, scope: !19)
!25 = !DILocation(line: 14, column: 38, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !8, line: 14, column: 3)
!27 = !DILocation(line: 14, column: 8, scope: !26)
!28 = !DILocation(line: 14, column: 43, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !8, line: 14, column: 3)
!30 = !DILocation(line: 14, column: 73, scope: !29)
!31 = !DILocation(line: 14, column: 3, scope: !26)
!32 = !DILocation(line: 17, column: 70, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !8, line: 16, column: 3)
!34 = !DILocation(line: 17, column: 36, scope: !33)
!35 = !DILocation(line: 17, column: 5, scope: !33)
!36 = !DILocation(line: 17, column: 67, scope: !33)
!37 = !DILocation(line: 18, column: 3, scope: !33)
!38 = !DILocation(line: 15, column: 37, scope: !29)
!39 = !DILocation(line: 14, column: 3, scope: !29)
!40 = distinct !{!40, !31, !41}
!41 = !DILocation(line: 18, column: 3, scope: !26)
!42 = !DILocation(line: 19, column: 1, scope: !19)
!43 = distinct !DISubprogram(name: "svp_simple_017_001_isr_1", scope: !8, file: !8, line: 21, type: !20, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DILocation(line: 22, column: 3, scope: !43)
!45 = !DILocation(line: 24, column: 33, scope: !43)
!46 = !DILocation(line: 26, column: 34, scope: !43)
!47 = !DILocation(line: 26, column: 3, scope: !43)
!48 = !DILocation(line: 26, column: 65, scope: !43)
!49 = !DILocation(line: 27, column: 1, scope: !43)
