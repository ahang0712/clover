; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/deepseek/svp_simple_700_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_700_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g = local_unnamed_addr global i32 42, align 4, !dbg !0
@h = local_unnamed_addr global i32 42, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() local_unnamed_addr #0 !dbg !16 {
entry:
  %call = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !19
  ret void, !dbg !20
}

declare i32 @assert(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %cond) local_unnamed_addr #0 !dbg !21 {
entry:
  %cond.addr = alloca i32, align 4
  store i32 %cond, i32* %cond.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cond.addr, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i32, i32* %cond.addr, align 4, !dbg !26
  %tobool = icmp ne i32 %0, 0, !dbg !28
  br i1 %tobool, label %if.end, label %if.then, !dbg !29

if.then:                                          ; preds = %entry
  br label %ERROR, !dbg !30

ERROR:                                            ; preds = %if.then
  call void @llvm.dbg.label(metadata !31), !dbg !33
  call void @reach_error(), !dbg !34
  call void @abort() #4, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  ret void, !dbg !37
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_700_001_isr_1(i8* %arg) local_unnamed_addr #0 !dbg !38 {
entry:
  %arg.addr = alloca i8*, align 8
  %x = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %x, metadata !44, metadata !DIExpression()), !dbg !45
  %call = call i32 (...) @__VERIFIER_nondet_int(), !dbg !46
  store i32 %call, i32* %x, align 4, !dbg !45
  %0 = load i32, i32* %x, align 4, !dbg !47
  %cmp = icmp sgt i32 %0, -1000, !dbg !49
  br i1 %cmp, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %x, align 4, !dbg !51
  store i32 %1, i32* @g, align 4, !dbg !53
  %2 = load i32, i32* %x, align 4, !dbg !54
  %sub = sub nsw i32 %2, 17, !dbg !55
  store i32 %sub, i32* @h, align 4, !dbg !56
  %3 = load i32, i32* %x, align 4, !dbg !57
  store i32 %3, i32* @h, align 4, !dbg !58
  br label %if.end, !dbg !59

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !60
}

declare i32 @__VERIFIER_nondet_int(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_700_001_isr_2(i8* %arg) local_unnamed_addr #0 !dbg !61 {
entry:
  %arg.addr = alloca i8*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i32* %x, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i32 (...) @__VERIFIER_nondet_int(), !dbg !66
  store i32 %call, i32* %x, align 4, !dbg !65
  call void @llvm.dbg.declare(metadata i32* %y, metadata !67, metadata !DIExpression()), !dbg !68
  %call1 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !69
  store i32 %call1, i32* %y, align 4, !dbg !68
  %0 = load i32, i32* @g, align 4, !dbg !70
  store i32 %0, i32* %x, align 4, !dbg !71
  %1 = load i32, i32* @h, align 4, !dbg !72
  store i32 %1, i32* %y, align 4, !dbg !73
  %2 = load i32, i32* %y, align 4, !dbg !74
  %3 = load i32, i32* %x, align 4, !dbg !75
  %cmp = icmp sle i32 %2, %3, !dbg !76
  %conv = zext i1 %cmp to i32, !dbg !76
  call void @__VERIFIER_assert(i32 %conv), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_700_001_main() local_unnamed_addr #0 !dbg !79 {
entry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i32 (...) @__VERIFIER_nondet_int(), !dbg !84
  store i32 %call, i32* %x, align 4, !dbg !83
  call void @llvm.dbg.declare(metadata i32* %y, metadata !85, metadata !DIExpression()), !dbg !86
  %call1 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !87
  store i32 %call1, i32* %y, align 4, !dbg !86
  %0 = load i32, i32* @g, align 4, !dbg !88
  store i32 %0, i32* %x, align 4, !dbg !89
  %1 = load i32, i32* @h, align 4, !dbg !90
  store i32 %1, i32* %y, align 4, !dbg !91
  %2 = load i32, i32* %y, align 4, !dbg !92
  %3 = load i32, i32* %x, align 4, !dbg !93
  %cmp = icmp eq i32 %2, %3, !dbg !94
  %conv = zext i1 %cmp to i32, !dbg !94
  call void @__VERIFIER_assert(i32 %conv), !dbg !95
  %4 = load i32, i32* %y, align 4, !dbg !96
  %5 = load i32, i32* %x, align 4, !dbg !97
  %cmp2 = icmp eq i32 %4, %5, !dbg !98
  %conv3 = zext i1 %cmp2 to i32, !dbg !98
  call void @__VERIFIER_assert(i32 %conv3), !dbg !99
  ret i32 0, !dbg !100
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_700_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "h", scope: !2, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_700_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{!"clang version 10.0.0 "}
!16 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 3, type: !17, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocation(line: 3, column: 22, scope: !16)
!20 = !DILocation(line: 3, column: 33, scope: !16)
!21 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 4, type: !22, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !9}
!24 = !DILocalVariable(name: "cond", arg: 1, scope: !21, file: !8, line: 4, type: !9)
!25 = !DILocation(line: 4, column: 28, scope: !21)
!26 = !DILocation(line: 4, column: 41, scope: !27)
!27 = distinct !DILexicalBlock(scope: !21, file: !8, line: 4, column: 39)
!28 = !DILocation(line: 4, column: 40, scope: !27)
!29 = !DILocation(line: 4, column: 39, scope: !21)
!30 = !DILocation(line: 4, column: 48, scope: !27)
!31 = !DILabel(scope: !32, name: "ERROR", file: !8, line: 4)
!32 = distinct !DILexicalBlock(scope: !27, file: !8, line: 4, column: 48)
!33 = !DILocation(line: 4, column: 50, scope: !32)
!34 = !DILocation(line: 4, column: 58, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !8, line: 4, column: 57)
!36 = !DILocation(line: 4, column: 72, scope: !35)
!37 = !DILocation(line: 4, column: 84, scope: !21)
!38 = distinct !DISubprogram(name: "svp_simple_700_001_isr_1", scope: !8, file: !8, line: 14, type: !39, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DISubroutineType(types: !40)
!40 = !{null, !41}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!42 = !DILocalVariable(name: "arg", arg: 1, scope: !38, file: !8, line: 14, type: !41)
!43 = !DILocation(line: 14, column: 37, scope: !38)
!44 = !DILocalVariable(name: "x", scope: !38, file: !8, line: 15, type: !9)
!45 = !DILocation(line: 15, column: 7, scope: !38)
!46 = !DILocation(line: 15, column: 11, scope: !38)
!47 = !DILocation(line: 16, column: 7, scope: !48)
!48 = distinct !DILexicalBlock(scope: !38, file: !8, line: 16, column: 7)
!49 = !DILocation(line: 16, column: 9, scope: !48)
!50 = !DILocation(line: 16, column: 7, scope: !38)
!51 = !DILocation(line: 17, column: 9, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !8, line: 16, column: 18)
!53 = !DILocation(line: 17, column: 7, scope: !52)
!54 = !DILocation(line: 18, column: 9, scope: !52)
!55 = !DILocation(line: 18, column: 11, scope: !52)
!56 = !DILocation(line: 18, column: 7, scope: !52)
!57 = !DILocation(line: 20, column: 9, scope: !52)
!58 = !DILocation(line: 20, column: 7, scope: !52)
!59 = !DILocation(line: 22, column: 3, scope: !52)
!60 = !DILocation(line: 24, column: 1, scope: !38)
!61 = distinct !DISubprogram(name: "svp_simple_700_001_isr_2", scope: !8, file: !8, line: 26, type: !39, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocalVariable(name: "arg", arg: 1, scope: !61, file: !8, line: 26, type: !41)
!63 = !DILocation(line: 26, column: 37, scope: !61)
!64 = !DILocalVariable(name: "x", scope: !61, file: !8, line: 27, type: !9)
!65 = !DILocation(line: 27, column: 7, scope: !61)
!66 = !DILocation(line: 27, column: 11, scope: !61)
!67 = !DILocalVariable(name: "y", scope: !61, file: !8, line: 28, type: !9)
!68 = !DILocation(line: 28, column: 7, scope: !61)
!69 = !DILocation(line: 28, column: 11, scope: !61)
!70 = !DILocation(line: 30, column: 7, scope: !61)
!71 = !DILocation(line: 30, column: 5, scope: !61)
!72 = !DILocation(line: 31, column: 7, scope: !61)
!73 = !DILocation(line: 31, column: 5, scope: !61)
!74 = !DILocation(line: 33, column: 21, scope: !61)
!75 = !DILocation(line: 33, column: 26, scope: !61)
!76 = !DILocation(line: 33, column: 23, scope: !61)
!77 = !DILocation(line: 33, column: 3, scope: !61)
!78 = !DILocation(line: 35, column: 1, scope: !61)
!79 = distinct !DISubprogram(name: "svp_simple_700_001_main", scope: !8, file: !8, line: 48, type: !80, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DISubroutineType(types: !81)
!81 = !{!9}
!82 = !DILocalVariable(name: "x", scope: !79, file: !8, line: 49, type: !9)
!83 = !DILocation(line: 49, column: 7, scope: !79)
!84 = !DILocation(line: 49, column: 11, scope: !79)
!85 = !DILocalVariable(name: "y", scope: !79, file: !8, line: 50, type: !9)
!86 = !DILocation(line: 50, column: 7, scope: !79)
!87 = !DILocation(line: 50, column: 11, scope: !79)
!88 = !DILocation(line: 53, column: 7, scope: !79)
!89 = !DILocation(line: 53, column: 5, scope: !79)
!90 = !DILocation(line: 54, column: 7, scope: !79)
!91 = !DILocation(line: 54, column: 5, scope: !79)
!92 = !DILocation(line: 56, column: 21, scope: !79)
!93 = !DILocation(line: 56, column: 26, scope: !79)
!94 = !DILocation(line: 56, column: 23, scope: !79)
!95 = !DILocation(line: 56, column: 3, scope: !79)
!96 = !DILocation(line: 58, column: 21, scope: !79)
!97 = !DILocation(line: 58, column: 26, scope: !79)
!98 = !DILocation(line: 58, column: 23, scope: !79)
!99 = !DILocation(line: 58, column: 3, scope: !79)
!100 = !DILocation(line: 59, column: 3, scope: !79)
