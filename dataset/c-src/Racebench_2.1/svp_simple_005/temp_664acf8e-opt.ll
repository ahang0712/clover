; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_005/temp_664acf8e.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_005/temp_664acf8e.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_005_001_global_condition = global i32 0, align 4, !dbg !0
@svp_simple_005_001_global_var = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_005_001_main() local_unnamed_addr #0 !dbg !16 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void (...) @init(), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %1, metadata !20, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %1, align 4, !dbg !22
  br label %3, !dbg !23

3:                                                ; preds = %22, %0
  %4 = load i32, i32* %1, align 4, !dbg !24
  %5 = icmp slt i32 %4, 10000, !dbg !26
  br i1 %5, label %6, label %25, !dbg !27

6:                                                ; preds = %3
  call void @llvm.dbg.declare(metadata i32* %2, metadata !28, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %2, align 4, !dbg !31
  br label %7, !dbg !32

7:                                                ; preds = %18, %6
  %8 = load i32, i32* %2, align 4, !dbg !33
  %9 = icmp slt i32 %8, 10000, !dbg !35
  br i1 %9, label %10, label %21, !dbg !36

10:                                               ; preds = %7
  %11 = load i32, i32* %1, align 4, !dbg !37
  %12 = icmp eq i32 %11, 9999, !dbg !40
  br i1 %12, label %13, label %17, !dbg !41

13:                                               ; preds = %10
  %14 = load i32, i32* %2, align 4, !dbg !42
  %15 = icmp eq i32 %14, 1000, !dbg !43
  br i1 %15, label %16, label %17, !dbg !44

16:                                               ; preds = %13
  store volatile i32 1, i32* @svp_simple_005_001_global_var, align 4, !dbg !45
  br label %17, !dbg !46

17:                                               ; preds = %16, %13, %10
  br label %18, !dbg !47

18:                                               ; preds = %17
  %19 = load i32, i32* %2, align 4, !dbg !48
  %20 = add nsw i32 %19, 1, !dbg !48
  store i32 %20, i32* %2, align 4, !dbg !48
  br label %7, !dbg !49, !llvm.loop !50

21:                                               ; preds = %7
  br label %22, !dbg !52

22:                                               ; preds = %21
  %23 = load i32, i32* %1, align 4, !dbg !53
  %24 = add nsw i32 %23, 1, !dbg !53
  store i32 %24, i32* %1, align 4, !dbg !53
  br label %3, !dbg !54, !llvm.loop !55

25:                                               ; preds = %3
  %26 = load volatile i32, i32* @svp_simple_005_001_global_condition, align 4, !dbg !57
  %27 = icmp eq i32 %26, 1, !dbg !59
  br i1 %27, label %28, label %29, !dbg !60

28:                                               ; preds = %25
  store volatile i32 9, i32* @svp_simple_005_001_global_var, align 4, !dbg !61
  br label %29, !dbg !63

29:                                               ; preds = %28, %25
  store volatile i32 5, i32* @svp_simple_005_001_global_var, align 4, !dbg !64
  ret void, !dbg !65
}

declare void @init(...) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_005_001_isr_1() local_unnamed_addr #0 !dbg !66 {
  %1 = alloca i32, align 4
  call void (...) @idlerun(), !dbg !67
  call void @llvm.dbg.declare(metadata i32* %1, metadata !68, metadata !DIExpression()), !dbg !69
  %2 = load volatile i32, i32* @svp_simple_005_001_global_var, align 4, !dbg !70
  store i32 %2, i32* %1, align 4, !dbg !71
  ret void, !dbg !72
}

declare void @idlerun(...) local_unnamed_addr #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_005_001_global_condition", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_005/temp_664acf8e.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_005_001_global_var", scope: !2, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_005/temp_664acf8e.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{!"clang version 10.0.0 "}
!16 = distinct !DISubprogram(name: "svp_simple_005_001_main", scope: !8, file: !8, line: 12, type: !17, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocation(line: 13, column: 1, scope: !16)
!20 = !DILocalVariable(name: "i", scope: !21, file: !8, line: 14, type: !10)
!21 = distinct !DILexicalBlock(scope: !16, file: !8, line: 14, column: 1)
!22 = !DILocation(line: 14, column: 10, scope: !21)
!23 = !DILocation(line: 14, column: 6, scope: !21)
!24 = !DILocation(line: 14, column: 17, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !8, line: 14, column: 1)
!26 = !DILocation(line: 14, column: 19, scope: !25)
!27 = !DILocation(line: 14, column: 1, scope: !21)
!28 = !DILocalVariable(name: "j", scope: !29, file: !8, line: 15, type: !10)
!29 = distinct !DILexicalBlock(scope: !30, file: !8, line: 15, column: 1)
!30 = distinct !DILexicalBlock(scope: !25, file: !8, line: 14, column: 38)
!31 = !DILocation(line: 15, column: 10, scope: !29)
!32 = !DILocation(line: 15, column: 6, scope: !29)
!33 = !DILocation(line: 15, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !8, line: 15, column: 1)
!35 = !DILocation(line: 15, column: 19, scope: !34)
!36 = !DILocation(line: 15, column: 1, scope: !29)
!37 = !DILocation(line: 16, column: 6, scope: !38)
!38 = distinct !DILexicalBlock(scope: !39, file: !8, line: 16, column: 5)
!39 = distinct !DILexicalBlock(scope: !34, file: !8, line: 15, column: 38)
!40 = !DILocation(line: 16, column: 8, scope: !38)
!41 = !DILocation(line: 16, column: 20, scope: !38)
!42 = !DILocation(line: 16, column: 24, scope: !38)
!43 = !DILocation(line: 16, column: 26, scope: !38)
!44 = !DILocation(line: 16, column: 5, scope: !39)
!45 = !DILocation(line: 17, column: 31, scope: !38)
!46 = !DILocation(line: 17, column: 1, scope: !38)
!47 = !DILocation(line: 18, column: 1, scope: !39)
!48 = !DILocation(line: 15, column: 34, scope: !34)
!49 = !DILocation(line: 15, column: 1, scope: !34)
!50 = distinct !{!50, !36, !51}
!51 = !DILocation(line: 18, column: 1, scope: !29)
!52 = !DILocation(line: 19, column: 1, scope: !30)
!53 = !DILocation(line: 14, column: 34, scope: !25)
!54 = !DILocation(line: 14, column: 1, scope: !25)
!55 = distinct !{!55, !27, !56}
!56 = !DILocation(line: 19, column: 1, scope: !21)
!57 = !DILocation(line: 21, column: 5, scope: !58)
!58 = distinct !DILexicalBlock(scope: !16, file: !8, line: 21, column: 5)
!59 = !DILocation(line: 21, column: 41, scope: !58)
!60 = !DILocation(line: 21, column: 5, scope: !16)
!61 = !DILocation(line: 23, column: 31, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !8, line: 21, column: 46)
!63 = !DILocation(line: 24, column: 1, scope: !62)
!64 = !DILocation(line: 25, column: 31, scope: !16)
!65 = !DILocation(line: 26, column: 1, scope: !16)
!66 = distinct !DISubprogram(name: "svp_simple_005_001_isr_1", scope: !8, file: !8, line: 28, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocation(line: 29, column: 1, scope: !66)
!68 = !DILocalVariable(name: "reader", scope: !66, file: !8, line: 30, type: !10)
!69 = !DILocation(line: 30, column: 5, scope: !66)
!70 = !DILocation(line: 31, column: 10, scope: !66)
!71 = !DILocation(line: 31, column: 8, scope: !66)
!72 = !DILocation(line: 32, column: 1, scope: !66)
