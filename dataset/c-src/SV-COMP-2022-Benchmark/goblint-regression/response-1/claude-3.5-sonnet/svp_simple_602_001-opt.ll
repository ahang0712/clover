; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/claude-3.5-sonnet/svp_simple_602_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_602_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@A = local_unnamed_addr global i32 5, align 4, !dbg !0
@B = local_unnamed_addr global i32 5, align 4, !dbg !6

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
  call void @abort() #5, !dbg !36
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
define i8* @generate(i8* %arg) local_unnamed_addr #0 !dbg !38 {
entry:
  %retval = alloca i8*, align 8
  %arg.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %i, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 1, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !49
  %cmp = icmp slt i32 %0, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !53
  store i32 %1, i32* @A, align 4, !dbg !55
  store i32 5, i32* @A, align 4, !dbg !56
  %call = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 1), !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !59
  %inc = add nsw i32 %2, 1, !dbg !59
  store i32 %inc, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %3 = load i8*, i8** %retval, align 8, !dbg !63
  ret i8* %3, !dbg !63
}

declare i32 @sleep(...) local_unnamed_addr #1

; Function Attrs: noinline noreturn nounwind optnone ssp uwtable
define i8* @process(i8* %arg) local_unnamed_addr #4 !dbg !64 {
entry:
  %arg.addr = alloca i8*, align 8
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !65, metadata !DIExpression()), !dbg !66
  br label %while.body, !dbg !67

while.body:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* @A, align 4, !dbg !68
  %cmp = icmp sgt i32 %0, 0, !dbg !71
  br i1 %cmp, label %if.then, label %if.else, !dbg !72

if.then:                                          ; preds = %while.body
  %1 = load i32, i32* @A, align 4, !dbg !73
  %inc = add nsw i32 %1, 1, !dbg !73
  store i32 %inc, i32* @A, align 4, !dbg !73
  %2 = load i32, i32* @A, align 4, !dbg !75
  store i32 %2, i32* @B, align 4, !dbg !76
  %3 = load i32, i32* @B, align 4, !dbg !77
  %dec = add nsw i32 %3, -1, !dbg !77
  store i32 %dec, i32* @B, align 4, !dbg !77
  %4 = load i32, i32* @A, align 4, !dbg !78
  %dec1 = add nsw i32 %4, -1, !dbg !78
  store i32 %dec1, i32* @A, align 4, !dbg !78
  br label %if.end, !dbg !79

if.else:                                          ; preds = %while.body
  %call = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 2), !dbg !80
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.body, !dbg !67, !llvm.loop !81
}

; Function Attrs: noinline noreturn nounwind optnone ssp uwtable
define i8* @dispose(i8* %arg) local_unnamed_addr #4 !dbg !83 {
entry:
  %arg.addr = alloca i8*, align 8
  %p = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i32* %p, metadata !86, metadata !DIExpression()), !dbg !87
  br label %while.body, !dbg !88

while.body:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* @B, align 4, !dbg !89
  %cmp = icmp sgt i32 %0, 0, !dbg !92
  br i1 %cmp, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %while.body
  %1 = load i32, i32* @B, align 4, !dbg !94
  store i32 %1, i32* %p, align 4, !dbg !96
  %2 = load i32, i32* %p, align 4, !dbg !97
  %cmp1 = icmp eq i32 %2, 5, !dbg !98
  %conv = zext i1 %cmp1 to i32, !dbg !98
  call void @__VERIFIER_assert(i32 %conv), !dbg !99
  br label %if.end, !dbg !100

if.else:                                          ; preds = %while.body
  %call = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 5), !dbg !101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.body, !dbg !88, !llvm.loop !102
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_602_001_main() local_unnamed_addr #0 !dbg !104 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 0, i32* %i, align 4, !dbg !109
  br label %for.cond, !dbg !111

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !112
  %cmp = icmp slt i32 %0, 10, !dbg !114
  br i1 %cmp, label %for.body, label %for.end, !dbg !115

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* @A, align 4, !dbg !116
  %2 = load i32, i32* @B, align 4, !dbg !118
  %cmp1 = icmp eq i32 %1, %2, !dbg !119
  %conv = zext i1 %cmp1 to i32, !dbg !119
  call void @__VERIFIER_assert(i32 %conv), !dbg !120
  %call = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 3), !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !123
  %inc = add nsw i32 %3, 1, !dbg !123
  store i32 %inc, i32* %i, align 4, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !127
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline noreturn nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn }

!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "A", scope: !2, file: !8, line: 6, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_602_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "B", scope: !2, file: !8, line: 7, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_602_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{!"clang version 10.0.0 "}
!16 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !17, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocation(line: 2, column: 22, scope: !16)
!20 = !DILocation(line: 2, column: 33, scope: !16)
!21 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 3, type: !22, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !9}
!24 = !DILocalVariable(name: "cond", arg: 1, scope: !21, file: !8, line: 3, type: !9)
!25 = !DILocation(line: 3, column: 28, scope: !21)
!26 = !DILocation(line: 3, column: 41, scope: !27)
!27 = distinct !DILexicalBlock(scope: !21, file: !8, line: 3, column: 39)
!28 = !DILocation(line: 3, column: 40, scope: !27)
!29 = !DILocation(line: 3, column: 39, scope: !21)
!30 = !DILocation(line: 3, column: 48, scope: !27)
!31 = !DILabel(scope: !32, name: "ERROR", file: !8, line: 3)
!32 = distinct !DILexicalBlock(scope: !27, file: !8, line: 3, column: 48)
!33 = !DILocation(line: 3, column: 50, scope: !32)
!34 = !DILocation(line: 3, column: 58, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !8, line: 3, column: 57)
!36 = !DILocation(line: 3, column: 72, scope: !35)
!37 = !DILocation(line: 3, column: 84, scope: !21)
!38 = distinct !DISubprogram(name: "generate", scope: !8, file: !8, line: 10, type: !39, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DISubroutineType(types: !40)
!40 = !{!41, !41}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!42 = !DILocalVariable(name: "arg", arg: 1, scope: !38, file: !8, line: 10, type: !41)
!43 = !DILocation(line: 10, column: 22, scope: !38)
!44 = !DILocalVariable(name: "i", scope: !38, file: !8, line: 11, type: !9)
!45 = !DILocation(line: 11, column: 7, scope: !38)
!46 = !DILocation(line: 12, column: 9, scope: !47)
!47 = distinct !DILexicalBlock(scope: !38, file: !8, line: 12, column: 3)
!48 = !DILocation(line: 12, column: 8, scope: !47)
!49 = !DILocation(line: 12, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !8, line: 12, column: 3)
!51 = !DILocation(line: 12, column: 14, scope: !50)
!52 = !DILocation(line: 12, column: 3, scope: !47)
!53 = !DILocation(line: 14, column: 9, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !8, line: 12, column: 25)
!55 = !DILocation(line: 14, column: 7, scope: !54)
!56 = !DILocation(line: 15, column: 7, scope: !54)
!57 = !DILocation(line: 17, column: 5, scope: !54)
!58 = !DILocation(line: 18, column: 3, scope: !54)
!59 = !DILocation(line: 12, column: 21, scope: !50)
!60 = !DILocation(line: 12, column: 3, scope: !50)
!61 = distinct !{!61, !52, !62}
!62 = !DILocation(line: 18, column: 3, scope: !47)
!63 = !DILocation(line: 19, column: 1, scope: !38)
!64 = distinct !DISubprogram(name: "process", scope: !8, file: !8, line: 21, type: !39, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocalVariable(name: "arg", arg: 1, scope: !64, file: !8, line: 21, type: !41)
!66 = !DILocation(line: 21, column: 21, scope: !64)
!67 = !DILocation(line: 22, column: 3, scope: !64)
!68 = !DILocation(line: 24, column: 9, scope: !69)
!69 = distinct !DILexicalBlock(scope: !70, file: !8, line: 24, column: 9)
!70 = distinct !DILexicalBlock(scope: !64, file: !8, line: 22, column: 13)
!71 = !DILocation(line: 24, column: 11, scope: !69)
!72 = !DILocation(line: 24, column: 9, scope: !70)
!73 = !DILocation(line: 25, column: 8, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !8, line: 24, column: 16)
!75 = !DILocation(line: 26, column: 11, scope: !74)
!76 = !DILocation(line: 26, column: 9, scope: !74)
!77 = !DILocation(line: 27, column: 8, scope: !74)
!78 = !DILocation(line: 28, column: 8, scope: !74)
!79 = !DILocation(line: 29, column: 5, scope: !74)
!80 = !DILocation(line: 31, column: 5, scope: !69)
!81 = distinct !{!81, !67, !82}
!82 = !DILocation(line: 32, column: 3, scope: !64)
!83 = distinct !DISubprogram(name: "dispose", scope: !8, file: !8, line: 35, type: !39, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocalVariable(name: "arg", arg: 1, scope: !83, file: !8, line: 35, type: !41)
!85 = !DILocation(line: 35, column: 21, scope: !83)
!86 = !DILocalVariable(name: "p", scope: !83, file: !8, line: 36, type: !9)
!87 = !DILocation(line: 36, column: 7, scope: !83)
!88 = !DILocation(line: 37, column: 3, scope: !83)
!89 = !DILocation(line: 38, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !91, file: !8, line: 38, column: 9)
!91 = distinct !DILexicalBlock(scope: !83, file: !8, line: 37, column: 13)
!92 = !DILocation(line: 38, column: 11, scope: !90)
!93 = !DILocation(line: 38, column: 9, scope: !91)
!94 = !DILocation(line: 39, column: 11, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !8, line: 38, column: 16)
!96 = !DILocation(line: 39, column: 9, scope: !95)
!97 = !DILocation(line: 40, column: 25, scope: !95)
!98 = !DILocation(line: 40, column: 27, scope: !95)
!99 = !DILocation(line: 40, column: 7, scope: !95)
!100 = !DILocation(line: 41, column: 5, scope: !95)
!101 = !DILocation(line: 43, column: 5, scope: !90)
!102 = distinct !{!102, !88, !103}
!103 = !DILocation(line: 44, column: 3, scope: !83)
!104 = distinct !DISubprogram(name: "svp_simple_602_001_main", scope: !8, file: !8, line: 47, type: !105, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DISubroutineType(types: !106)
!106 = !{!9}
!107 = !DILocalVariable(name: "i", scope: !104, file: !8, line: 48, type: !9)
!108 = !DILocation(line: 48, column: 7, scope: !104)
!109 = !DILocation(line: 50, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !8, line: 50, column: 3)
!111 = !DILocation(line: 50, column: 8, scope: !110)
!112 = !DILocation(line: 50, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !8, line: 50, column: 3)
!114 = !DILocation(line: 50, column: 14, scope: !113)
!115 = !DILocation(line: 50, column: 3, scope: !110)
!116 = !DILocation(line: 53, column: 23, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !8, line: 50, column: 24)
!118 = !DILocation(line: 53, column: 28, scope: !117)
!119 = !DILocation(line: 53, column: 25, scope: !117)
!120 = !DILocation(line: 53, column: 5, scope: !117)
!121 = !DILocation(line: 57, column: 5, scope: !117)
!122 = !DILocation(line: 58, column: 3, scope: !117)
!123 = !DILocation(line: 50, column: 20, scope: !113)
!124 = !DILocation(line: 50, column: 3, scope: !113)
!125 = distinct !{!125, !115, !126}
!126 = !DILocation(line: 58, column: 3, scope: !110)
!127 = !DILocation(line: 59, column: 3, scope: !104)
