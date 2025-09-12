; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/Idv-races/response-1/LongCat-Large-32K-Chat/svp_simple_304_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/Idv-races/svp_simple_304_001.c"
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
define void @svp_simple_304_001_isr_1(i8* %arg) local_unnamed_addr #0 !dbg !35 {
entry:
  %arg.addr = alloca i8*, align 8
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 6, i32* @pdev, align 4, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @module_init() local_unnamed_addr #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  store i32 1, i32* @pdev, align 4, !dbg !46
  %0 = load i32, i32* @pdev, align 4, !dbg !47
  %cmp = icmp eq i32 %0, 1, !dbg !48
  %conv = zext i1 %cmp to i32, !dbg !48
  call void @ldv_assert(i32 %conv), !dbg !49
  %call = call i32 @__VERIFIER_nondet_int(), !dbg !50
  %tobool = icmp ne i32 %call, 0, !dbg !50
  br i1 %tobool, label %if.then, label %if.end, !dbg !52

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !53
  br label %return, !dbg !53

if.end:                                           ; preds = %entry
  store i32 3, i32* @pdev, align 4, !dbg !55
  %1 = load i32, i32* @pdev, align 4, !dbg !56
  %cmp1 = icmp eq i32 %1, 3, !dbg !57
  %conv2 = zext i1 %cmp1 to i32, !dbg !57
  call void @ldv_assert(i32 %conv2), !dbg !58
  store i32 -1, i32* %retval, align 4, !dbg !59
  br label %return, !dbg !59

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4, !dbg !60
  ret i32 %2, !dbg !60
}

declare i32 @__VERIFIER_nondet_int() local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @module_exit() local_unnamed_addr #0 !dbg !61 {
entry:
  %status = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %status, metadata !62, metadata !DIExpression()), !dbg !63
  store i32 4, i32* @pdev, align 4, !dbg !64
  %0 = load i32, i32* @pdev, align 4, !dbg !65
  %cmp = icmp eq i32 %0, 4, !dbg !66
  %conv = zext i1 %cmp to i32, !dbg !66
  call void @ldv_assert(i32 %conv), !dbg !67
  store i32 5, i32* @pdev, align 4, !dbg !68
  %1 = load i32, i32* @pdev, align 4, !dbg !69
  %cmp1 = icmp eq i32 %1, 5, !dbg !70
  %conv2 = zext i1 %cmp1 to i32, !dbg !70
  call void @ldv_assert(i32 %conv2), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_304_001_main() local_unnamed_addr #0 !dbg !73 {
entry:
  %call = call i32 @module_init(), !dbg !74
  %cmp = icmp ne i32 %call, 0, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  call void @module_exit(), !dbg !78
  br label %if.end, !dbg !80

if.end:                                           ; preds = %if.then, %entry
  call void @module_exit(), !dbg !81
  call void @module_exit(), !dbg !82
  ret i32 0, !dbg !83
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
!1 = distinct !DIGlobalVariable(name: "pdev", scope: !2, file: !6, line: 10, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/Idv-races/svp_simple_304_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/Idv-races/svp_simple_304_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "reach_error", scope: !6, file: !6, line: 6, type: !15, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocation(line: 6, column: 22, scope: !14)
!18 = !DILocation(line: 6, column: 33, scope: !14)
!19 = distinct !DISubprogram(name: "ldv_assert", scope: !6, file: !6, line: 8, type: !20, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !7}
!22 = !DILocalVariable(name: "expression", arg: 1, scope: !19, file: !6, line: 8, type: !7)
!23 = !DILocation(line: 8, column: 21, scope: !19)
!24 = !DILocation(line: 8, column: 40, scope: !25)
!25 = distinct !DILexicalBlock(scope: !19, file: !6, line: 8, column: 39)
!26 = !DILocation(line: 8, column: 39, scope: !19)
!27 = !DILocation(line: 8, column: 52, scope: !25)
!28 = !DILabel(scope: !29, name: "ERROR", file: !6, line: 8)
!29 = distinct !DILexicalBlock(scope: !25, file: !6, line: 8, column: 52)
!30 = !DILocation(line: 8, column: 54, scope: !29)
!31 = !DILocation(line: 8, column: 62, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !6, line: 8, column: 61)
!33 = !DILocation(line: 8, column: 76, scope: !32)
!34 = !DILocation(line: 8, column: 88, scope: !19)
!35 = distinct !DISubprogram(name: "svp_simple_304_001_isr_1", scope: !6, file: !6, line: 12, type: !36, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DISubroutineType(types: !37)
!37 = !{null, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!39 = !DILocalVariable(name: "arg", arg: 1, scope: !35, file: !6, line: 12, type: !38)
!40 = !DILocation(line: 12, column: 37, scope: !35)
!41 = !DILocation(line: 14, column: 9, scope: !35)
!42 = !DILocation(line: 16, column: 1, scope: !35)
!43 = distinct !DISubprogram(name: "module_init", scope: !6, file: !6, line: 18, type: !44, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !45)
!45 = !{!7}
!46 = !DILocation(line: 19, column: 9, scope: !43)
!47 = !DILocation(line: 20, column: 15, scope: !43)
!48 = !DILocation(line: 20, column: 19, scope: !43)
!49 = !DILocation(line: 20, column: 4, scope: !43)
!50 = !DILocation(line: 21, column: 7, scope: !51)
!51 = distinct !DILexicalBlock(scope: !43, file: !6, line: 21, column: 7)
!52 = !DILocation(line: 21, column: 7, scope: !43)
!53 = !DILocation(line: 22, column: 7, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !6, line: 21, column: 32)
!55 = !DILocation(line: 24, column: 9, scope: !43)
!56 = !DILocation(line: 25, column: 15, scope: !43)
!57 = !DILocation(line: 25, column: 19, scope: !43)
!58 = !DILocation(line: 25, column: 4, scope: !43)
!59 = !DILocation(line: 26, column: 4, scope: !43)
!60 = !DILocation(line: 27, column: 1, scope: !43)
!61 = distinct !DISubprogram(name: "module_exit", scope: !6, file: !6, line: 29, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocalVariable(name: "status", scope: !61, file: !6, line: 30, type: !38)
!63 = !DILocation(line: 30, column: 10, scope: !61)
!64 = !DILocation(line: 31, column: 9, scope: !61)
!65 = !DILocation(line: 32, column: 15, scope: !61)
!66 = !DILocation(line: 32, column: 19, scope: !61)
!67 = !DILocation(line: 32, column: 4, scope: !61)
!68 = !DILocation(line: 33, column: 9, scope: !61)
!69 = !DILocation(line: 34, column: 15, scope: !61)
!70 = !DILocation(line: 34, column: 19, scope: !61)
!71 = !DILocation(line: 34, column: 4, scope: !61)
!72 = !DILocation(line: 35, column: 1, scope: !61)
!73 = distinct !DISubprogram(name: "svp_simple_304_001_main", scope: !6, file: !6, line: 37, type: !44, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocation(line: 38, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !73, file: !6, line: 38, column: 8)
!76 = !DILocation(line: 38, column: 21, scope: !75)
!77 = !DILocation(line: 38, column: 8, scope: !73)
!78 = !DILocation(line: 39, column: 7, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !6, line: 38, column: 25)
!80 = !DILocation(line: 40, column: 7, scope: !79)
!81 = !DILocation(line: 41, column: 5, scope: !73)
!82 = !DILocation(line: 42, column: 5, scope: !73)
!83 = !DILocation(line: 43, column: 5, scope: !73)
