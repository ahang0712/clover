; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/Idv-races/response-1/deepseek/svp_simple_300_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/Idv-races/svp_simple_300_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@pdev = common local_unnamed_addr global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() local_unnamed_addr #0 !dbg !14 {
entry:
  %call = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !17
  ret void, !dbg !18
}

declare i32 @assert(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @ldv_assert(i32 %expression) local_unnamed_addr #0 !dbg !19 {
entry:
  %expression.addr = alloca i32, align 4
  store i32 %expression, i32* %expression.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %expression.addr, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i32, i32* %expression.addr, align 4, !dbg !24
  %tobool = icmp ne i32 %0, 0, !dbg !24
  br i1 %tobool, label %if.end, label %if.then, !dbg !26

if.then:                                          ; preds = %entry
  br label %ERROR, !dbg !27

ERROR:                                            ; preds = %if.then
  call void @llvm.dbg.label(metadata !28), !dbg !30
  call void @reach_error(), !dbg !31
  call void @abort() #4, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  ret void, !dbg !34
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @isr_ldv_assert(i32 %expression) local_unnamed_addr #0 !dbg !35 {
entry:
  %expression.addr = alloca i32, align 4
  store i32 %expression, i32* %expression.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %expression.addr, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i32, i32* %expression.addr, align 4, !dbg !38
  %tobool = icmp ne i32 %0, 0, !dbg !38
  br i1 %tobool, label %if.end, label %if.then, !dbg !40

if.then:                                          ; preds = %entry
  br label %ERROR, !dbg !41

ERROR:                                            ; preds = %if.then
  call void @llvm.dbg.label(metadata !42), !dbg !44
  call void @reach_error(), !dbg !45
  call void @abort() #4, !dbg !47
  unreachable, !dbg !47

if.end:                                           ; preds = %entry
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_300_001_isr_1(i8* %arg) local_unnamed_addr #0 !dbg !49 {
entry:
  %arg.addr = alloca i8*, align 8
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 6, i32* @pdev, align 4, !dbg !55
  %0 = load i32, i32* @pdev, align 4, !dbg !56
  %cmp = icmp eq i32 %0, 6, !dbg !57
  %conv = zext i1 %cmp to i32, !dbg !57
  call void @isr_ldv_assert(i32 %conv), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @module_init() local_unnamed_addr #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  store i32 1, i32* @pdev, align 4, !dbg !63
  %0 = load i32, i32* @pdev, align 4, !dbg !64
  %cmp = icmp eq i32 %0, 1, !dbg !65
  %conv = zext i1 %cmp to i32, !dbg !65
  call void @ldv_assert(i32 %conv), !dbg !66
  %call = call i32 @__VERIFIER_nondet_int(), !dbg !67
  %tobool = icmp ne i32 %call, 0, !dbg !67
  br i1 %tobool, label %if.then, label %if.end, !dbg !69

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !70
  br label %return, !dbg !70

if.end:                                           ; preds = %entry
  store i32 3, i32* @pdev, align 4, !dbg !72
  %1 = load i32, i32* @pdev, align 4, !dbg !73
  %cmp1 = icmp eq i32 %1, 3, !dbg !74
  %conv2 = zext i1 %cmp1 to i32, !dbg !74
  call void @ldv_assert(i32 %conv2), !dbg !75
  store i32 -1, i32* %retval, align 4, !dbg !76
  br label %return, !dbg !76

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4, !dbg !77
  ret i32 %2, !dbg !77
}

declare i32 @__VERIFIER_nondet_int() local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @module_exit() local_unnamed_addr #0 !dbg !78 {
entry:
  store i32 5, i32* @pdev, align 4, !dbg !79
  %0 = load i32, i32* @pdev, align 4, !dbg !80
  %cmp = icmp eq i32 %0, 5, !dbg !81
  %conv = zext i1 %cmp to i32, !dbg !81
  call void @ldv_assert(i32 %conv), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_300_001_main() local_unnamed_addr #0 !dbg !84 {
entry:
  %call = call i32 @module_init(), !dbg !85
  %cmp = icmp ne i32 %call, 0, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  call void @module_exit(), !dbg !89
  br label %if.end, !dbg !91

if.end:                                           ; preds = %if.then, %entry
  call void @module_exit(), !dbg !92
  call void @module_exit(), !dbg !93
  ret i32 0, !dbg !94
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "pdev", scope: !2, file: !6, line: 8, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/Idv-races/svp_simple_300_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/Idv-races/svp_simple_300_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "reach_error", scope: !6, file: !6, line: 3, type: !15, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocation(line: 3, column: 22, scope: !14)
!18 = !DILocation(line: 3, column: 33, scope: !14)
!19 = distinct !DISubprogram(name: "ldv_assert", scope: !6, file: !6, line: 5, type: !20, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !7}
!22 = !DILocalVariable(name: "expression", arg: 1, scope: !19, file: !6, line: 5, type: !7)
!23 = !DILocation(line: 5, column: 21, scope: !19)
!24 = !DILocation(line: 5, column: 40, scope: !25)
!25 = distinct !DILexicalBlock(scope: !19, file: !6, line: 5, column: 39)
!26 = !DILocation(line: 5, column: 39, scope: !19)
!27 = !DILocation(line: 5, column: 52, scope: !25)
!28 = !DILabel(scope: !29, name: "ERROR", file: !6, line: 5)
!29 = distinct !DILexicalBlock(scope: !25, file: !6, line: 5, column: 52)
!30 = !DILocation(line: 5, column: 54, scope: !29)
!31 = !DILocation(line: 5, column: 62, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !6, line: 5, column: 61)
!33 = !DILocation(line: 5, column: 76, scope: !32)
!34 = !DILocation(line: 5, column: 88, scope: !19)
!35 = distinct !DISubprogram(name: "isr_ldv_assert", scope: !6, file: !6, line: 6, type: !20, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DILocalVariable(name: "expression", arg: 1, scope: !35, file: !6, line: 6, type: !7)
!37 = !DILocation(line: 6, column: 25, scope: !35)
!38 = !DILocation(line: 6, column: 44, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !6, line: 6, column: 43)
!40 = !DILocation(line: 6, column: 43, scope: !35)
!41 = !DILocation(line: 6, column: 56, scope: !39)
!42 = !DILabel(scope: !43, name: "ERROR", file: !6, line: 6)
!43 = distinct !DILexicalBlock(scope: !39, file: !6, line: 6, column: 56)
!44 = !DILocation(line: 6, column: 58, scope: !43)
!45 = !DILocation(line: 6, column: 66, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !6, line: 6, column: 65)
!47 = !DILocation(line: 6, column: 80, scope: !46)
!48 = !DILocation(line: 6, column: 92, scope: !35)
!49 = distinct !DISubprogram(name: "svp_simple_300_001_isr_1", scope: !6, file: !6, line: 10, type: !50, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DISubroutineType(types: !51)
!51 = !{null, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!53 = !DILocalVariable(name: "arg", arg: 1, scope: !49, file: !6, line: 10, type: !52)
!54 = !DILocation(line: 10, column: 37, scope: !49)
!55 = !DILocation(line: 11, column: 9, scope: !49)
!56 = !DILocation(line: 12, column: 19, scope: !49)
!57 = !DILocation(line: 12, column: 23, scope: !49)
!58 = !DILocation(line: 12, column: 4, scope: !49)
!59 = !DILocation(line: 13, column: 1, scope: !49)
!60 = distinct !DISubprogram(name: "module_init", scope: !6, file: !6, line: 15, type: !61, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!7}
!63 = !DILocation(line: 16, column: 9, scope: !60)
!64 = !DILocation(line: 17, column: 15, scope: !60)
!65 = !DILocation(line: 17, column: 19, scope: !60)
!66 = !DILocation(line: 17, column: 4, scope: !60)
!67 = !DILocation(line: 18, column: 7, scope: !68)
!68 = distinct !DILexicalBlock(scope: !60, file: !6, line: 18, column: 7)
!69 = !DILocation(line: 18, column: 7, scope: !60)
!70 = !DILocation(line: 19, column: 7, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !6, line: 18, column: 32)
!72 = !DILocation(line: 21, column: 9, scope: !60)
!73 = !DILocation(line: 22, column: 15, scope: !60)
!74 = !DILocation(line: 22, column: 19, scope: !60)
!75 = !DILocation(line: 22, column: 4, scope: !60)
!76 = !DILocation(line: 23, column: 4, scope: !60)
!77 = !DILocation(line: 24, column: 1, scope: !60)
!78 = distinct !DISubprogram(name: "module_exit", scope: !6, file: !6, line: 26, type: !15, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocation(line: 27, column: 9, scope: !78)
!80 = !DILocation(line: 28, column: 15, scope: !78)
!81 = !DILocation(line: 28, column: 19, scope: !78)
!82 = !DILocation(line: 28, column: 4, scope: !78)
!83 = !DILocation(line: 29, column: 1, scope: !78)
!84 = distinct !DISubprogram(name: "svp_simple_300_001_main", scope: !6, file: !6, line: 31, type: !61, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DILocation(line: 32, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !84, file: !6, line: 32, column: 8)
!87 = !DILocation(line: 32, column: 22, scope: !86)
!88 = !DILocation(line: 32, column: 8, scope: !84)
!89 = !DILocation(line: 33, column: 7, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !6, line: 32, column: 27)
!91 = !DILocation(line: 34, column: 4, scope: !90)
!92 = !DILocation(line: 35, column: 5, scope: !84)
!93 = !DILocation(line: 36, column: 5, scope: !84)
!94 = !DILocation(line: 37, column: 5, scope: !84)
