; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_002/svp_simple_002_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_002/svp_simple_002_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_002_001_global_array = common global [100000 x i32] zeroinitializer, align 16, !dbg !0
@casee2_global_var = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_002_001_main() #0 !dbg !19 {
  call void (...) @init(), !dbg !22
  call void (...) @idlerun(), !dbg !23
  ret void, !dbg !24
}

declare void @init(...) #1

declare void @idlerun(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_002_001_isr_1() #0 !dbg !25 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %2, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %3, metadata !30, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %3, align 4, !dbg !32
  br label %4, !dbg !33

4:                                                ; preds = %16, %0
  %5 = load i32, i32* %3, align 4, !dbg !34
  %6 = icmp slt i32 %5, 100000, !dbg !36
  br i1 %6, label %7, label %19, !dbg !37

7:                                                ; preds = %4
  %8 = load i32, i32* %3, align 4, !dbg !38
  %9 = icmp eq i32 %8, 9999, !dbg !41
  br i1 %9, label %10, label %11, !dbg !42

10:                                               ; preds = %7
  store volatile i32 1, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 9999), align 4, !dbg !43
  br label %11, !dbg !44

11:                                               ; preds = %10, %7
  %12 = load i32, i32* %3, align 4, !dbg !45
  %13 = icmp eq i32 %12, 100001, !dbg !47
  br i1 %13, label %14, label %15, !dbg !48

14:                                               ; preds = %11
  store volatile i32 1, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 9999), align 4, !dbg !49
  br label %15, !dbg !50

15:                                               ; preds = %14, %11
  br label %16, !dbg !51

16:                                               ; preds = %15
  %17 = load i32, i32* %3, align 4, !dbg !52
  %18 = add nsw i32 %17, 1, !dbg !52
  store i32 %18, i32* %3, align 4, !dbg !52
  br label %4, !dbg !53, !llvm.loop !54

19:                                               ; preds = %4
  %20 = load volatile i32, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 9999), align 4, !dbg !56
  %21 = sub nsw i32 %20, 10, !dbg !57
  store i32 %21, i32* %1, align 4, !dbg !58
  %22 = load volatile i32, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 0), align 16, !dbg !59
  %23 = add nsw i32 %22, 10, !dbg !60
  store i32 %23, i32* %2, align 4, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_002_001_isr_2() #0 !dbg !63 {
  call void (...) @idlerun(), !dbg !64
  store volatile i32 999, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 9999), align 4, !dbg !65
  ret void, !dbg !66
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_002_001_global_array", scope: !2, file: !8, line: 7, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_002/svp_simple_002_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "casee2_global_var", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_002/svp_simple_002_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200000, elements: !12)
!12 = !{!13}
!13 = !DISubrange(count: 100000)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"PIC Level", i32 2}
!18 = !{!"clang version 10.0.0 "}
!19 = distinct !DISubprogram(name: "svp_simple_002_001_main", scope: !8, file: !8, line: 10, type: !20, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocation(line: 11, column: 3, scope: !19)
!23 = !DILocation(line: 12, column: 3, scope: !19)
!24 = !DILocation(line: 13, column: 1, scope: !19)
!25 = distinct !DISubprogram(name: "svp_simple_002_001_isr_1", scope: !8, file: !8, line: 15, type: !20, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DILocalVariable(name: "mininum", scope: !25, file: !8, line: 16, type: !10)
!27 = !DILocation(line: 16, column: 7, scope: !25)
!28 = !DILocalVariable(name: "maxnum", scope: !25, file: !8, line: 16, type: !10)
!29 = !DILocation(line: 16, column: 16, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !31, file: !8, line: 17, type: !10)
!31 = distinct !DILexicalBlock(scope: !25, file: !8, line: 17, column: 3)
!32 = !DILocation(line: 17, column: 12, scope: !31)
!33 = !DILocation(line: 17, column: 8, scope: !31)
!34 = !DILocation(line: 17, column: 19, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !8, line: 17, column: 3)
!36 = !DILocation(line: 17, column: 21, scope: !35)
!37 = !DILocation(line: 17, column: 3, scope: !31)
!38 = !DILocation(line: 18, column: 9, scope: !39)
!39 = distinct !DILexicalBlock(scope: !40, file: !8, line: 18, column: 9)
!40 = distinct !DILexicalBlock(scope: !35, file: !8, line: 17, column: 40)
!41 = !DILocation(line: 18, column: 11, scope: !39)
!42 = !DILocation(line: 18, column: 9, scope: !40)
!43 = !DILocation(line: 18, column: 64, scope: !39)
!44 = !DILocation(line: 18, column: 23, scope: !39)
!45 = !DILocation(line: 19, column: 9, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !8, line: 19, column: 9)
!47 = !DILocation(line: 19, column: 11, scope: !46)
!48 = !DILocation(line: 19, column: 9, scope: !40)
!49 = !DILocation(line: 20, column: 48, scope: !46)
!50 = !DILocation(line: 20, column: 7, scope: !46)
!51 = !DILocation(line: 21, column: 3, scope: !40)
!52 = !DILocation(line: 17, column: 36, scope: !35)
!53 = !DILocation(line: 17, column: 3, scope: !35)
!54 = distinct !{!54, !37, !55}
!55 = !DILocation(line: 21, column: 3, scope: !31)
!56 = !DILocation(line: 22, column: 13, scope: !25)
!57 = !DILocation(line: 22, column: 54, scope: !25)
!58 = !DILocation(line: 22, column: 11, scope: !25)
!59 = !DILocation(line: 24, column: 12, scope: !25)
!60 = !DILocation(line: 24, column: 47, scope: !25)
!61 = !DILocation(line: 24, column: 10, scope: !25)
!62 = !DILocation(line: 25, column: 1, scope: !25)
!63 = distinct !DISubprogram(name: "svp_simple_002_001_isr_2", scope: !8, file: !8, line: 27, type: !20, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocation(line: 28, column: 3, scope: !63)
!65 = !DILocation(line: 29, column: 44, scope: !63)
!66 = !DILocation(line: 31, column: 1, scope: !63)
