; ModuleID = 'example_simple_project/src/math_ops.c'
source_filename = "example_simple_project/src/math_ops.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @add(i32 %0, i32 %1) #0 !dbg !8 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !12, metadata !DIExpression()), !dbg !13
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !14, metadata !DIExpression()), !dbg !15
  %5 = load i32, i32* %3, align 4, !dbg !16
  %6 = load i32, i32* %4, align 4, !dbg !17
  %7 = call i32 @validate_input(i32 %5, i32 %6), !dbg !18
  %8 = load i32, i32* %3, align 4, !dbg !19
  %9 = load i32, i32* %4, align 4, !dbg !20
  %10 = add nsw i32 %8, %9, !dbg !21
  ret i32 %10, !dbg !22
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @validate_input(i32 %0, i32 %1) #0 !dbg !23 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !26, metadata !DIExpression()), !dbg !27
  %6 = load i32, i32* %5, align 4, !dbg !28
  %7 = icmp eq i32 %6, 0, !dbg !30
  br i1 %7, label %8, label %9, !dbg !31

8:                                                ; preds = %2
  store i32 0, i32* %3, align 4, !dbg !32
  br label %10, !dbg !32

9:                                                ; preds = %2
  store i32 1, i32* %3, align 4, !dbg !34
  br label %10, !dbg !34

10:                                               ; preds = %9, %8
  %11 = load i32, i32* %3, align 4, !dbg !35
  ret i32 %11, !dbg !35
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @subtract(i32 %0, i32 %1) #0 !dbg !36 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !39, metadata !DIExpression()), !dbg !40
  %5 = load i32, i32* %3, align 4, !dbg !41
  %6 = load i32, i32* %4, align 4, !dbg !42
  %7 = call i32 @validate_input(i32 %5, i32 %6), !dbg !43
  %8 = load i32, i32* %3, align 4, !dbg !44
  %9 = load i32, i32* %4, align 4, !dbg !45
  %10 = sub nsw i32 %8, %9, !dbg !46
  ret i32 %10, !dbg !47
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @multiply(i32 %0, i32 %1) #0 !dbg !48 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !51, metadata !DIExpression()), !dbg !52
  %5 = load i32, i32* %3, align 4, !dbg !53
  %6 = load i32, i32* %4, align 4, !dbg !54
  %7 = call i32 @validate_input(i32 %5, i32 %6), !dbg !55
  %8 = load i32, i32* %3, align 4, !dbg !56
  %9 = load i32, i32* %4, align 4, !dbg !57
  %10 = mul nsw i32 %8, %9, !dbg !58
  ret i32 %10, !dbg !59
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "example_simple_project/src/math_ops.c", directory: "/Users/hehang03/code/clover/tool/Control_flow_Analyzer")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 10.0.0 "}
!8 = distinct !DISubprogram(name: "add", scope: !1, file: !1, line: 20, type: !9, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "a", arg: 1, scope: !8, file: !1, line: 20, type: !11)
!13 = !DILocation(line: 20, column: 13, scope: !8)
!14 = !DILocalVariable(name: "b", arg: 2, scope: !8, file: !1, line: 20, type: !11)
!15 = !DILocation(line: 20, column: 20, scope: !8)
!16 = !DILocation(line: 21, column: 20, scope: !8)
!17 = !DILocation(line: 21, column: 23, scope: !8)
!18 = !DILocation(line: 21, column: 5, scope: !8)
!19 = !DILocation(line: 22, column: 12, scope: !8)
!20 = !DILocation(line: 22, column: 16, scope: !8)
!21 = !DILocation(line: 22, column: 14, scope: !8)
!22 = !DILocation(line: 22, column: 5, scope: !8)
!23 = distinct !DISubprogram(name: "validate_input", scope: !1, file: !1, line: 9, type: !9, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!24 = !DILocalVariable(name: "a", arg: 1, scope: !23, file: !1, line: 9, type: !11)
!25 = !DILocation(line: 9, column: 31, scope: !23)
!26 = !DILocalVariable(name: "b", arg: 2, scope: !23, file: !1, line: 9, type: !11)
!27 = !DILocation(line: 9, column: 38, scope: !23)
!28 = !DILocation(line: 11, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !23, file: !1, line: 11, column: 9)
!30 = !DILocation(line: 11, column: 11, scope: !29)
!31 = !DILocation(line: 11, column: 9, scope: !23)
!32 = !DILocation(line: 12, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !1, line: 11, column: 17)
!34 = !DILocation(line: 14, column: 5, scope: !23)
!35 = !DILocation(line: 15, column: 1, scope: !23)
!36 = distinct !DISubprogram(name: "subtract", scope: !1, file: !1, line: 28, type: !9, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocalVariable(name: "a", arg: 1, scope: !36, file: !1, line: 28, type: !11)
!38 = !DILocation(line: 28, column: 18, scope: !36)
!39 = !DILocalVariable(name: "b", arg: 2, scope: !36, file: !1, line: 28, type: !11)
!40 = !DILocation(line: 28, column: 25, scope: !36)
!41 = !DILocation(line: 29, column: 20, scope: !36)
!42 = !DILocation(line: 29, column: 23, scope: !36)
!43 = !DILocation(line: 29, column: 5, scope: !36)
!44 = !DILocation(line: 30, column: 12, scope: !36)
!45 = !DILocation(line: 30, column: 16, scope: !36)
!46 = !DILocation(line: 30, column: 14, scope: !36)
!47 = !DILocation(line: 30, column: 5, scope: !36)
!48 = distinct !DISubprogram(name: "multiply", scope: !1, file: !1, line: 36, type: !9, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocalVariable(name: "a", arg: 1, scope: !48, file: !1, line: 36, type: !11)
!50 = !DILocation(line: 36, column: 18, scope: !48)
!51 = !DILocalVariable(name: "b", arg: 2, scope: !48, file: !1, line: 36, type: !11)
!52 = !DILocation(line: 36, column: 25, scope: !48)
!53 = !DILocation(line: 37, column: 20, scope: !48)
!54 = !DILocation(line: 37, column: 23, scope: !48)
!55 = !DILocation(line: 37, column: 5, scope: !48)
!56 = !DILocation(line: 38, column: 12, scope: !48)
!57 = !DILocation(line: 38, column: 16, scope: !48)
!58 = !DILocation(line: 38, column: 14, scope: !48)
!59 = !DILocation(line: 38, column: 5, scope: !48)
