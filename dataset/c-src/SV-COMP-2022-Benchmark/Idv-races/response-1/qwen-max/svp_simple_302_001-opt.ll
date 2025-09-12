; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/Idv-races/response-1/qwen-max/svp_simple_302_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/Idv-races/svp_simple_302_001.c"
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
define void @svp_simple_302_001_isr_1(i8* %arg) local_unnamed_addr #0 !dbg !35 {
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
  store i32 2, i32* @pdev, align 4, !dbg !53
  %1 = load i32, i32* @pdev, align 4, !dbg !55
  %cmp1 = icmp eq i32 %1, 2, !dbg !56
  %conv2 = zext i1 %cmp1 to i32, !dbg !56
  call void @ldv_assert(i32 %conv2), !dbg !57
  store i32 0, i32* %retval, align 4, !dbg !58
  br label %return, !dbg !58

if.end:                                           ; preds = %entry
  store i32 3, i32* @pdev, align 4, !dbg !59
  %2 = load i32, i32* @pdev, align 4, !dbg !60
  %cmp3 = icmp eq i32 %2, 3, !dbg !61
  %conv4 = zext i1 %cmp3 to i32, !dbg !61
  call void @ldv_assert(i32 %conv4), !dbg !62
  store i32 -1, i32* %retval, align 4, !dbg !63
  br label %return, !dbg !63

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !64
  ret i32 %3, !dbg !64
}

declare i32 @__VERIFIER_nondet_int() local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @module_exit() local_unnamed_addr #0 !dbg !65 {
entry:
  %status = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %status, metadata !66, metadata !DIExpression()), !dbg !67
  store i32 5, i32* @pdev, align 4, !dbg !68
  %0 = load i32, i32* @pdev, align 4, !dbg !69
  %cmp = icmp eq i32 %0, 5, !dbg !70
  %conv = zext i1 %cmp to i32, !dbg !70
  call void @ldv_assert(i32 %conv), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_302_001_main() local_unnamed_addr #0 !dbg !73 {
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
!1 = distinct !DIGlobalVariable(name: "pdev", scope: !2, file: !6, line: 8, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/Idv-races/svp_simple_302_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/Idv-races/svp_simple_302_001.c", directory: "/Users/hehang03/code/clover")
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
!35 = distinct !DISubprogram(name: "svp_simple_302_001_isr_1", scope: !6, file: !6, line: 10, type: !36, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DISubroutineType(types: !37)
!37 = !{null, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!39 = !DILocalVariable(name: "arg", arg: 1, scope: !35, file: !6, line: 10, type: !38)
!40 = !DILocation(line: 10, column: 37, scope: !35)
!41 = !DILocation(line: 11, column: 9, scope: !35)
!42 = !DILocation(line: 12, column: 1, scope: !35)
!43 = distinct !DISubprogram(name: "module_init", scope: !6, file: !6, line: 14, type: !44, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !45)
!45 = !{!7}
!46 = !DILocation(line: 15, column: 9, scope: !43)
!47 = !DILocation(line: 16, column: 15, scope: !43)
!48 = !DILocation(line: 16, column: 19, scope: !43)
!49 = !DILocation(line: 16, column: 4, scope: !43)
!50 = !DILocation(line: 17, column: 7, scope: !51)
!51 = distinct !DILexicalBlock(scope: !43, file: !6, line: 17, column: 7)
!52 = !DILocation(line: 17, column: 7, scope: !43)
!53 = !DILocation(line: 18, column: 12, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !6, line: 17, column: 32)
!55 = !DILocation(line: 19, column: 18, scope: !54)
!56 = !DILocation(line: 19, column: 22, scope: !54)
!57 = !DILocation(line: 19, column: 7, scope: !54)
!58 = !DILocation(line: 20, column: 7, scope: !54)
!59 = !DILocation(line: 23, column: 9, scope: !43)
!60 = !DILocation(line: 24, column: 15, scope: !43)
!61 = !DILocation(line: 24, column: 19, scope: !43)
!62 = !DILocation(line: 24, column: 4, scope: !43)
!63 = !DILocation(line: 25, column: 4, scope: !43)
!64 = !DILocation(line: 26, column: 1, scope: !43)
!65 = distinct !DISubprogram(name: "module_exit", scope: !6, file: !6, line: 28, type: !15, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocalVariable(name: "status", scope: !65, file: !6, line: 29, type: !38)
!67 = !DILocation(line: 29, column: 10, scope: !65)
!68 = !DILocation(line: 30, column: 9, scope: !65)
!69 = !DILocation(line: 31, column: 15, scope: !65)
!70 = !DILocation(line: 31, column: 19, scope: !65)
!71 = !DILocation(line: 31, column: 4, scope: !65)
!72 = !DILocation(line: 32, column: 1, scope: !65)
!73 = distinct !DISubprogram(name: "svp_simple_302_001_main", scope: !6, file: !6, line: 34, type: !44, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocation(line: 35, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !73, file: !6, line: 35, column: 8)
!76 = !DILocation(line: 35, column: 22, scope: !75)
!77 = !DILocation(line: 35, column: 8, scope: !73)
!78 = !DILocation(line: 36, column: 7, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !6, line: 35, column: 27)
!80 = !DILocation(line: 37, column: 4, scope: !79)
!81 = !DILocation(line: 38, column: 5, scope: !73)
!82 = !DILocation(line: 39, column: 5, scope: !73)
!83 = !DILocation(line: 40, column: 5, scope: !73)
