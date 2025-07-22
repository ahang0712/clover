; ModuleID = 'svp_simple_001_001_new.ll'
source_filename = "svp_simple_001_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_001_001_global_flag = global i32 0, align 4, !dbg !0
@svp_simple_001_001_global_array = common global [10000 x i32] zeroinitializer, align 16, !dbg !10
@svp_simple_001_001_global_var = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_001_001_main() local_unnamed_addr #0 !dbg !20 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void (...) @init(), !dbg !23
  call void @disable_isr(i32 2), !dbg !24
  call void (...) @idlerun(), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %1, metadata !26, metadata !DIExpression()), !dbg !28
  store i32 0, i32* %1, align 4, !dbg !28
  br label %3, !dbg !29

3:                                                ; preds = %10, %0
  %4 = load i32, i32* %1, align 4, !dbg !30
  %5 = icmp slt i32 %4, 10000, !dbg !32
  br i1 %5, label %6, label %13, !dbg !33

6:                                                ; preds = %3
  %7 = load i32, i32* %1, align 4, !dbg !34
  %8 = sext i32 %7 to i64, !dbg !35
  %9 = getelementptr inbounds [10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 %8, !dbg !35
  store volatile i32 0, i32* %9, align 4, !dbg !36
  br label %10, !dbg !35

10:                                               ; preds = %6
  %11 = load i32, i32* %1, align 4, !dbg !37
  %12 = add nsw i32 %11, 1, !dbg !37
  store i32 %12, i32* %1, align 4, !dbg !37
  br label %3, !dbg !38, !llvm.loop !39

13:                                               ; preds = %3
  call void @llvm.dbg.declare(metadata i32* %2, metadata !41, metadata !DIExpression()), !dbg !43
  store i32 0, i32* %2, align 4, !dbg !43
  br label %14, !dbg !44

14:                                               ; preds = %25, %13
  %15 = load i32, i32* %2, align 4, !dbg !45
  %16 = icmp slt i32 %15, 10000, !dbg !47
  br i1 %16, label %17, label %28, !dbg !48

17:                                               ; preds = %14
  %18 = load i32, i32* %2, align 4, !dbg !49
  %19 = icmp eq i32 %18, 9999, !dbg !52
  br i1 %19, label %20, label %24, !dbg !53

20:                                               ; preds = %17
  %21 = load i32, i32* %2, align 4, !dbg !54
  %22 = sext i32 %21 to i64, !dbg !55
  %23 = getelementptr inbounds [10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 %22, !dbg !55
  store volatile i32 1, i32* %23, align 4, !dbg !56
  br label %24, !dbg !55

24:                                               ; preds = %20, %17
  br label %25, !dbg !57

25:                                               ; preds = %24
  %26 = load i32, i32* %2, align 4, !dbg !58
  %27 = add nsw i32 %26, 1, !dbg !58
  store i32 %27, i32* %2, align 4, !dbg !58
  br label %14, !dbg !59, !llvm.loop !60

28:                                               ; preds = %14
  ret void, !dbg !62
}

declare void @init(...) local_unnamed_addr #1

declare void @disable_isr(i32) local_unnamed_addr #1

declare void @idlerun(...) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_001_001_isr_1() local_unnamed_addr #0 !dbg !63 {
  call void (...) @idlerun(), !dbg !64
  store volatile i32 1, i32* @svp_simple_001_001_global_flag, align 4, !dbg !65
  store volatile i32 0, i32* @svp_simple_001_001_global_var, align 4, !dbg !66
  store volatile i32 1, i32* @svp_simple_001_001_global_var, align 4, !dbg !67
  call void @enable_isr(i32 2), !dbg !68
  call void (...) @idlerun(), !dbg !69
  ret void, !dbg !70
}

declare void @enable_isr(i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_001_001_isr_2() local_unnamed_addr #0 !dbg !71 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i32* %2, metadata !74, metadata !DIExpression()), !dbg !75
  %4 = load volatile i32, i32* @svp_simple_001_001_global_flag, align 4, !dbg !76
  %5 = icmp eq i32 %4, 1, !dbg !78
  br i1 %5, label %6, label %8, !dbg !79

6:                                                ; preds = %0
  %7 = load volatile i32, i32* getelementptr inbounds ([10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 9999), align 4, !dbg !80
  store i32 %7, i32* %1, align 4, !dbg !81
  br label %10, !dbg !82

8:                                                ; preds = %0
  %9 = load volatile i32, i32* getelementptr inbounds ([10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 0), align 16, !dbg !83
  store i32 %9, i32* %1, align 4, !dbg !85
  br label %10

10:                                               ; preds = %8, %6
  %11 = load volatile i32, i32* getelementptr inbounds ([10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 1000), align 16, !dbg !86
  store i32 %11, i32* %2, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata i32* %3, metadata !88, metadata !DIExpression()), !dbg !89
  %12 = load volatile i32, i32* @svp_simple_001_001_global_var, align 4, !dbg !90
  store i32 %12, i32* %3, align 4, !dbg !91
  ret void, !dbg !92
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_001_001_global_flag", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_001_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_001")
!4 = !{}
!5 = !{!0, !6, !10}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_001_001_global_var", scope: !2, file: !3, line: 4, type: !8, isLocal: false, isDefinition: true)
!8 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !9)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "svp_simple_001_001_global_array", scope: !2, file: !3, line: 5, type: !12, isLocal: false, isDefinition: true)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 320000, elements: !13)
!13 = !{!14}
!14 = !DISubrange(count: 10000)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{!"clang version 10.0.0 "}
!20 = distinct !DISubprogram(name: "svp_simple_001_001_main", scope: !3, file: !3, line: 10, type: !21, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocation(line: 12, column: 3, scope: !20)
!24 = !DILocation(line: 14, column: 3, scope: !20)
!25 = !DILocation(line: 16, column: 3, scope: !20)
!26 = !DILocalVariable(name: "i", scope: !27, file: !3, line: 18, type: !9)
!27 = distinct !DILexicalBlock(scope: !20, file: !3, line: 18, column: 3)
!28 = !DILocation(line: 18, column: 12, scope: !27)
!29 = !DILocation(line: 18, column: 8, scope: !27)
!30 = !DILocation(line: 18, column: 19, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !3, line: 18, column: 3)
!32 = !DILocation(line: 18, column: 21, scope: !31)
!33 = !DILocation(line: 18, column: 3, scope: !27)
!34 = !DILocation(line: 19, column: 37, scope: !31)
!35 = !DILocation(line: 19, column: 5, scope: !31)
!36 = !DILocation(line: 19, column: 40, scope: !31)
!37 = !DILocation(line: 18, column: 31, scope: !31)
!38 = !DILocation(line: 18, column: 3, scope: !31)
!39 = distinct !{!39, !33, !40}
!40 = !DILocation(line: 19, column: 42, scope: !27)
!41 = !DILocalVariable(name: "i", scope: !42, file: !3, line: 21, type: !9)
!42 = distinct !DILexicalBlock(scope: !20, file: !3, line: 21, column: 3)
!43 = !DILocation(line: 21, column: 12, scope: !42)
!44 = !DILocation(line: 21, column: 8, scope: !42)
!45 = !DILocation(line: 21, column: 19, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !3, line: 21, column: 3)
!47 = !DILocation(line: 21, column: 21, scope: !46)
!48 = !DILocation(line: 21, column: 3, scope: !42)
!49 = !DILocation(line: 23, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !51, file: !3, line: 23, column: 9)
!51 = distinct !DILexicalBlock(scope: !46, file: !3, line: 22, column: 3)
!52 = !DILocation(line: 23, column: 11, scope: !50)
!53 = !DILocation(line: 23, column: 9, scope: !51)
!54 = !DILocation(line: 24, column: 39, scope: !50)
!55 = !DILocation(line: 24, column: 7, scope: !50)
!56 = !DILocation(line: 24, column: 42, scope: !50)
!57 = !DILocation(line: 25, column: 3, scope: !51)
!58 = !DILocation(line: 21, column: 31, scope: !46)
!59 = !DILocation(line: 21, column: 3, scope: !46)
!60 = distinct !{!60, !48, !61}
!61 = !DILocation(line: 25, column: 3, scope: !42)
!62 = !DILocation(line: 26, column: 1, scope: !20)
!63 = distinct !DISubprogram(name: "svp_simple_001_001_isr_1", scope: !3, file: !3, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocation(line: 30, column: 3, scope: !63)
!65 = !DILocation(line: 31, column: 34, scope: !63)
!66 = !DILocation(line: 33, column: 33, scope: !63)
!67 = !DILocation(line: 34, column: 33, scope: !63)
!68 = !DILocation(line: 36, column: 3, scope: !63)
!69 = !DILocation(line: 38, column: 3, scope: !63)
!70 = !DILocation(line: 39, column: 1, scope: !63)
!71 = distinct !DISubprogram(name: "svp_simple_001_001_isr_2", scope: !3, file: !3, line: 41, type: !21, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocalVariable(name: "reader1", scope: !71, file: !3, line: 43, type: !9)
!73 = !DILocation(line: 43, column: 7, scope: !71)
!74 = !DILocalVariable(name: "reader3", scope: !71, file: !3, line: 43, type: !9)
!75 = !DILocation(line: 43, column: 16, scope: !71)
!76 = !DILocation(line: 44, column: 7, scope: !77)
!77 = distinct !DILexicalBlock(scope: !71, file: !3, line: 44, column: 7)
!78 = !DILocation(line: 44, column: 38, scope: !77)
!79 = !DILocation(line: 44, column: 7, scope: !71)
!80 = !DILocation(line: 46, column: 15, scope: !77)
!81 = !DILocation(line: 46, column: 13, scope: !77)
!82 = !DILocation(line: 46, column: 5, scope: !77)
!83 = !DILocation(line: 50, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !3, line: 48, column: 3)
!85 = !DILocation(line: 49, column: 13, scope: !84)
!86 = !DILocation(line: 53, column: 13, scope: !71)
!87 = !DILocation(line: 53, column: 11, scope: !71)
!88 = !DILocalVariable(name: "reader2", scope: !71, file: !3, line: 55, type: !9)
!89 = !DILocation(line: 55, column: 7, scope: !71)
!90 = !DILocation(line: 56, column: 13, scope: !71)
!91 = !DILocation(line: 56, column: 11, scope: !71)
!92 = !DILocation(line: 57, column: 1, scope: !71)
