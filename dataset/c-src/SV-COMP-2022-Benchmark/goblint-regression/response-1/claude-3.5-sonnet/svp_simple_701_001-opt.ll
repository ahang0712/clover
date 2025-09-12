; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/claude-3.5-sonnet/svp_simple_701_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_701_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g = local_unnamed_addr global i32 0, align 4, !dbg !0
@h = local_unnamed_addr global i32 0, align 4, !dbg !6
@i = local_unnamed_addr global i32 0, align 4, !dbg !10

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() local_unnamed_addr #0 !dbg !18 {
entry:
  %call = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !21
  ret void, !dbg !22
}

declare i32 @assert(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %cond) local_unnamed_addr #0 !dbg !23 {
entry:
  %cond.addr = alloca i32, align 4
  store i32 %cond, i32* %cond.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cond.addr, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i32, i32* %cond.addr, align 4, !dbg !28
  %tobool = icmp ne i32 %0, 0, !dbg !30
  br i1 %tobool, label %if.end, label %if.then, !dbg !31

if.then:                                          ; preds = %entry
  br label %ERROR, !dbg !32

ERROR:                                            ; preds = %if.then
  call void @llvm.dbg.label(metadata !33), !dbg !35
  call void @reach_error(), !dbg !36
  call void @abort() #4, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %entry
  ret void, !dbg !39
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_701_001_isr_1(i8* %arg) local_unnamed_addr #0 !dbg !40 {
entry:
  %arg.addr = alloca i8*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i32* %x, metadata !46, metadata !DIExpression()), !dbg !47
  %call = call i32 (...) @__VERIFIER_nondet_int(), !dbg !48
  store i32 %call, i32* %x, align 4, !dbg !47
  call void @llvm.dbg.declare(metadata i32* %y, metadata !49, metadata !DIExpression()), !dbg !50
  %call1 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !51
  store i32 %call1, i32* %y, align 4, !dbg !50
  call void @llvm.dbg.declare(metadata i32* %z, metadata !52, metadata !DIExpression()), !dbg !53
  %call2 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !54
  store i32 %call2, i32* %z, align 4, !dbg !53
  %0 = load i32, i32* %x, align 4, !dbg !55
  %cmp = icmp slt i32 %0, 1000, !dbg !57
  br i1 %cmp, label %if.then, label %if.end, !dbg !58

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @g, align 4, !dbg !59
  store i32 %1, i32* %x, align 4, !dbg !61
  %2 = load i32, i32* @h, align 4, !dbg !62
  store i32 %2, i32* %y, align 4, !dbg !63
  %3 = load i32, i32* %y, align 4, !dbg !64
  %4 = load i32, i32* %x, align 4, !dbg !65
  %cmp3 = icmp sle i32 %3, %4, !dbg !66
  %conv = zext i1 %cmp3 to i32, !dbg !66
  call void @__VERIFIER_assert(i32 %conv), !dbg !67
  %5 = load i32, i32* %x, align 4, !dbg !68
  %6 = load i32, i32* %y, align 4, !dbg !69
  %cmp4 = icmp eq i32 %5, %6, !dbg !70
  %conv5 = zext i1 %cmp4 to i32, !dbg !70
  call void @__VERIFIER_assert(i32 %conv5), !dbg !71
  %7 = load i32, i32* %x, align 4, !dbg !72
  %add = add nsw i32 %7, 31, !dbg !73
  store i32 %add, i32* @i, align 4, !dbg !74
  %8 = load i32, i32* @i, align 4, !dbg !75
  store i32 %8, i32* %z, align 4, !dbg !76
  %9 = load i32, i32* %z, align 4, !dbg !77
  %10 = load i32, i32* %x, align 4, !dbg !78
  %cmp6 = icmp sge i32 %9, %10, !dbg !79
  %conv7 = zext i1 %cmp6 to i32, !dbg !79
  call void @__VERIFIER_assert(i32 %conv7), !dbg !80
  br label %if.end, !dbg !81

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !82
}

declare i32 @__VERIFIER_nondet_int(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_701_001_main() local_unnamed_addr #0 !dbg !83 {
entry:
  %x = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i32 (...) @__VERIFIER_nondet_int(), !dbg !88
  store i32 %call, i32* %x, align 4, !dbg !87
  %0 = load i32, i32* %x, align 4, !dbg !89
  %cmp = icmp sgt i32 %0, -1000, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  store i32 11, i32* @i, align 4, !dbg !93
  %1 = load i32, i32* %x, align 4, !dbg !95
  store i32 %1, i32* @g, align 4, !dbg !96
  %2 = load i32, i32* %x, align 4, !dbg !97
  %sub = sub nsw i32 %2, 17, !dbg !98
  store i32 %sub, i32* @h, align 4, !dbg !99
  %3 = load i32, i32* %x, align 4, !dbg !100
  store i32 %3, i32* @h, align 4, !dbg !101
  store i32 3, i32* @i, align 4, !dbg !102
  br label %if.end, !dbg !103

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !104
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !8, line: 9, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_701_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6, !10}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "h", scope: !2, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_701_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "i", scope: !2, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true)
!12 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{!"clang version 10.0.0 "}
!18 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !19, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocation(line: 2, column: 22, scope: !18)
!22 = !DILocation(line: 2, column: 33, scope: !18)
!23 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 3, type: !24, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !9}
!26 = !DILocalVariable(name: "cond", arg: 1, scope: !23, file: !8, line: 3, type: !9)
!27 = !DILocation(line: 3, column: 28, scope: !23)
!28 = !DILocation(line: 3, column: 41, scope: !29)
!29 = distinct !DILexicalBlock(scope: !23, file: !8, line: 3, column: 39)
!30 = !DILocation(line: 3, column: 40, scope: !29)
!31 = !DILocation(line: 3, column: 39, scope: !23)
!32 = !DILocation(line: 3, column: 48, scope: !29)
!33 = !DILabel(scope: !34, name: "ERROR", file: !8, line: 3)
!34 = distinct !DILexicalBlock(scope: !29, file: !8, line: 3, column: 48)
!35 = !DILocation(line: 3, column: 50, scope: !34)
!36 = !DILocation(line: 3, column: 58, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !8, line: 3, column: 57)
!38 = !DILocation(line: 3, column: 72, scope: !37)
!39 = !DILocation(line: 3, column: 84, scope: !23)
!40 = distinct !DISubprogram(name: "svp_simple_701_001_isr_1", scope: !8, file: !8, line: 14, type: !41, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DISubroutineType(types: !42)
!42 = !{null, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!44 = !DILocalVariable(name: "arg", arg: 1, scope: !40, file: !8, line: 14, type: !43)
!45 = !DILocation(line: 14, column: 37, scope: !40)
!46 = !DILocalVariable(name: "x", scope: !40, file: !8, line: 15, type: !9)
!47 = !DILocation(line: 15, column: 7, scope: !40)
!48 = !DILocation(line: 15, column: 11, scope: !40)
!49 = !DILocalVariable(name: "y", scope: !40, file: !8, line: 16, type: !9)
!50 = !DILocation(line: 16, column: 7, scope: !40)
!51 = !DILocation(line: 16, column: 11, scope: !40)
!52 = !DILocalVariable(name: "z", scope: !40, file: !8, line: 17, type: !9)
!53 = !DILocation(line: 17, column: 7, scope: !40)
!54 = !DILocation(line: 17, column: 11, scope: !40)
!55 = !DILocation(line: 18, column: 7, scope: !56)
!56 = distinct !DILexicalBlock(scope: !40, file: !8, line: 18, column: 7)
!57 = !DILocation(line: 18, column: 9, scope: !56)
!58 = !DILocation(line: 18, column: 7, scope: !40)
!59 = !DILocation(line: 19, column: 9, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !8, line: 18, column: 17)
!61 = !DILocation(line: 19, column: 7, scope: !60)
!62 = !DILocation(line: 20, column: 9, scope: !60)
!63 = !DILocation(line: 20, column: 7, scope: !60)
!64 = !DILocation(line: 21, column: 23, scope: !60)
!65 = !DILocation(line: 21, column: 28, scope: !60)
!66 = !DILocation(line: 21, column: 25, scope: !60)
!67 = !DILocation(line: 21, column: 5, scope: !60)
!68 = !DILocation(line: 23, column: 23, scope: !60)
!69 = !DILocation(line: 23, column: 28, scope: !60)
!70 = !DILocation(line: 23, column: 25, scope: !60)
!71 = !DILocation(line: 23, column: 5, scope: !60)
!72 = !DILocation(line: 25, column: 9, scope: !60)
!73 = !DILocation(line: 25, column: 11, scope: !60)
!74 = !DILocation(line: 25, column: 7, scope: !60)
!75 = !DILocation(line: 26, column: 9, scope: !60)
!76 = !DILocation(line: 26, column: 7, scope: !60)
!77 = !DILocation(line: 27, column: 23, scope: !60)
!78 = !DILocation(line: 27, column: 28, scope: !60)
!79 = !DILocation(line: 27, column: 25, scope: !60)
!80 = !DILocation(line: 27, column: 5, scope: !60)
!81 = !DILocation(line: 29, column: 3, scope: !60)
!82 = !DILocation(line: 31, column: 1, scope: !40)
!83 = distinct !DISubprogram(name: "svp_simple_701_001_main", scope: !8, file: !8, line: 33, type: !84, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DISubroutineType(types: !85)
!85 = !{!9}
!86 = !DILocalVariable(name: "x", scope: !83, file: !8, line: 34, type: !9)
!87 = !DILocation(line: 34, column: 7, scope: !83)
!88 = !DILocation(line: 34, column: 11, scope: !83)
!89 = !DILocation(line: 35, column: 7, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !8, line: 35, column: 7)
!91 = !DILocation(line: 35, column: 9, scope: !90)
!92 = !DILocation(line: 35, column: 7, scope: !83)
!93 = !DILocation(line: 37, column: 7, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !8, line: 35, column: 18)
!95 = !DILocation(line: 38, column: 9, scope: !94)
!96 = !DILocation(line: 38, column: 7, scope: !94)
!97 = !DILocation(line: 39, column: 9, scope: !94)
!98 = !DILocation(line: 39, column: 11, scope: !94)
!99 = !DILocation(line: 39, column: 7, scope: !94)
!100 = !DILocation(line: 41, column: 9, scope: !94)
!101 = !DILocation(line: 41, column: 7, scope: !94)
!102 = !DILocation(line: 43, column: 7, scope: !94)
!103 = !DILocation(line: 45, column: 3, scope: !94)
!104 = !DILocation(line: 46, column: 3, scope: !83)
