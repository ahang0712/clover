; ModuleID = 'example_simple.c'
source_filename = "example_simple.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@global_var = global i32 10, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !12 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 5, i32* %2, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata i32* %3, metadata !17, metadata !DIExpression()), !dbg !18
  %4 = load i32, i32* %2, align 4, !dbg !19
  %5 = load i32, i32* @global_var, align 4, !dbg !20
  %6 = call i32 @calculate_sum(i32 %4, i32 %5), !dbg !21
  store i32 %6, i32* %3, align 4, !dbg !18
  %7 = load i32, i32* %3, align 4, !dbg !22
  call void @helper_function(i32 %7), !dbg !23
  %8 = load i32, i32* %3, align 4, !dbg !24
  call void @print_result(i32 %8), !dbg !25
  ret i32 0, !dbg !26
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @calculate_sum(i32 %0, i32 %1) #0 !dbg !27 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !32, metadata !DIExpression()), !dbg !33
  %5 = load i32, i32* %3, align 4, !dbg !34
  %6 = load i32, i32* %4, align 4, !dbg !35
  %7 = add nsw i32 %5, %6, !dbg !36
  ret i32 %7, !dbg !37
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @helper_function(i32 %0) #0 !dbg !38 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !41, metadata !DIExpression()), !dbg !42
  %3 = load i32, i32* %2, align 4, !dbg !43
  %4 = icmp sgt i32 %3, 0, !dbg !45
  br i1 %4, label %5, label %8, !dbg !46

5:                                                ; preds = %1
  %6 = load i32, i32* %2, align 4, !dbg !47
  %7 = sub nsw i32 %6, 1, !dbg !49
  call void @helper_function(i32 %7), !dbg !50
  br label %8, !dbg !51

8:                                                ; preds = %5, %1
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @print_result(i32 %0) #0 !dbg !53 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i32* %3, metadata !56, metadata !DIExpression()), !dbg !57
  %4 = load i32, i32* %2, align 4, !dbg !58
  store i32 %4, i32* %3, align 4, !dbg !57
  %5 = load i32, i32* %2, align 4, !dbg !59
  %6 = icmp sgt i32 %5, 10, !dbg !61
  br i1 %6, label %7, label %8, !dbg !62

7:                                                ; preds = %1
  br label %8, !dbg !63

8:                                                ; preds = %7, %1
  ret void, !dbg !65
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "global_var", scope: !2, file: !3, line: 11, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "example_simple.c", directory: "/Users/hehang03/code/clover/tool/Control_flow_Analyzer")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{!"clang version 10.0.0 "}
!12 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 16, type: !13, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!13 = !DISubroutineType(types: !14)
!14 = !{!6}
!15 = !DILocalVariable(name: "local_var", scope: !12, file: !3, line: 17, type: !6)
!16 = !DILocation(line: 17, column: 9, scope: !12)
!17 = !DILocalVariable(name: "sum", scope: !12, file: !3, line: 20, type: !6)
!18 = !DILocation(line: 20, column: 9, scope: !12)
!19 = !DILocation(line: 20, column: 29, scope: !12)
!20 = !DILocation(line: 20, column: 40, scope: !12)
!21 = !DILocation(line: 20, column: 15, scope: !12)
!22 = !DILocation(line: 23, column: 21, scope: !12)
!23 = !DILocation(line: 23, column: 5, scope: !12)
!24 = !DILocation(line: 26, column: 18, scope: !12)
!25 = !DILocation(line: 26, column: 5, scope: !12)
!26 = !DILocation(line: 28, column: 5, scope: !12)
!27 = distinct !DISubprogram(name: "calculate_sum", scope: !3, file: !3, line: 44, type: !28, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!28 = !DISubroutineType(types: !29)
!29 = !{!6, !6, !6}
!30 = !DILocalVariable(name: "a", arg: 1, scope: !27, file: !3, line: 44, type: !6)
!31 = !DILocation(line: 44, column: 23, scope: !27)
!32 = !DILocalVariable(name: "b", arg: 2, scope: !27, file: !3, line: 44, type: !6)
!33 = !DILocation(line: 44, column: 30, scope: !27)
!34 = !DILocation(line: 45, column: 12, scope: !27)
!35 = !DILocation(line: 45, column: 16, scope: !27)
!36 = !DILocation(line: 45, column: 14, scope: !27)
!37 = !DILocation(line: 45, column: 5, scope: !27)
!38 = distinct !DISubprogram(name: "helper_function", scope: !3, file: !3, line: 34, type: !39, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DISubroutineType(types: !40)
!40 = !{null, !6}
!41 = !DILocalVariable(name: "value", arg: 1, scope: !38, file: !3, line: 34, type: !6)
!42 = !DILocation(line: 34, column: 26, scope: !38)
!43 = !DILocation(line: 36, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !3, line: 36, column: 9)
!45 = !DILocation(line: 36, column: 15, scope: !44)
!46 = !DILocation(line: 36, column: 9, scope: !38)
!47 = !DILocation(line: 37, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !3, line: 36, column: 20)
!49 = !DILocation(line: 37, column: 31, scope: !48)
!50 = !DILocation(line: 37, column: 9, scope: !48)
!51 = !DILocation(line: 38, column: 5, scope: !48)
!52 = !DILocation(line: 39, column: 1, scope: !38)
!53 = distinct !DISubprogram(name: "print_result", scope: !3, file: !3, line: 51, type: !39, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocalVariable(name: "result", arg: 1, scope: !53, file: !3, line: 51, type: !6)
!55 = !DILocation(line: 51, column: 23, scope: !53)
!56 = !DILocalVariable(name: "temp", scope: !53, file: !3, line: 53, type: !6)
!57 = !DILocation(line: 53, column: 9, scope: !53)
!58 = !DILocation(line: 53, column: 16, scope: !53)
!59 = !DILocation(line: 56, column: 9, scope: !60)
!60 = distinct !DILexicalBlock(scope: !53, file: !3, line: 56, column: 9)
!61 = !DILocation(line: 56, column: 16, scope: !60)
!62 = !DILocation(line: 56, column: 9, scope: !53)
!63 = !DILocation(line: 58, column: 5, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !3, line: 56, column: 22)
!65 = !DILocation(line: 59, column: 1, scope: !53)
