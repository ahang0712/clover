; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/qwen-max/svp_simple_600_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_600_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@glob1 = local_unnamed_addr global i32 5, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() local_unnamed_addr #0 !dbg !14 {
entry:
  %call = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !17
  ret void, !dbg !18
}

declare i32 @assert(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %cond) local_unnamed_addr #0 !dbg !19 {
entry:
  %cond.addr = alloca i32, align 4
  store i32 %cond, i32* %cond.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cond.addr, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i32, i32* %cond.addr, align 4, !dbg !24
  %tobool = icmp ne i32 %0, 0, !dbg !26
  br i1 %tobool, label %if.end, label %if.then, !dbg !27

if.then:                                          ; preds = %entry
  br label %ERROR, !dbg !28

ERROR:                                            ; preds = %if.then
  call void @llvm.dbg.label(metadata !29), !dbg !31
  call void @reach_error(), !dbg !32
  call void @abort() #4, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  ret void, !dbg !35
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @isr__VERIFIER_assert(i32 %cond) local_unnamed_addr #0 !dbg !36 {
entry:
  %cond.addr = alloca i32, align 4
  store i32 %cond, i32* %cond.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cond.addr, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = load i32, i32* %cond.addr, align 4, !dbg !39
  %tobool = icmp ne i32 %0, 0, !dbg !41
  br i1 %tobool, label %if.end, label %if.then, !dbg !42

if.then:                                          ; preds = %entry
  br label %ERROR, !dbg !43

ERROR:                                            ; preds = %if.then
  call void @llvm.dbg.label(metadata !44), !dbg !46
  call void @reach_error(), !dbg !47
  call void @abort() #4, !dbg !49
  unreachable, !dbg !49

if.end:                                           ; preds = %entry
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_600_001_isr_1(i8* %arg) local_unnamed_addr #0 !dbg !51 {
entry:
  %arg.addr = alloca i8*, align 8
  %t = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i32* %t, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* @glob1, align 4, !dbg !59
  store i32 %0, i32* %t, align 4, !dbg !60
  %1 = load i32, i32* %t, align 4, !dbg !61
  %cmp = icmp eq i32 %1, 5, !dbg !62
  %conv = zext i1 %cmp to i32, !dbg !62
  call void @isr__VERIFIER_assert(i32 %conv), !dbg !63
  store i32 -10, i32* @glob1, align 4, !dbg !64
  %2 = load i32, i32* @glob1, align 4, !dbg !65
  %cmp1 = icmp eq i32 %2, -10, !dbg !66
  %conv2 = zext i1 %cmp1 to i32, !dbg !66
  call void @isr__VERIFIER_assert(i32 %conv2), !dbg !67
  %3 = load i32, i32* %t, align 4, !dbg !68
  store i32 %3, i32* @glob1, align 4, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_600_001_main() local_unnamed_addr #0 !dbg !71 {
entry:
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %0 = load i32, i32* @glob1, align 4, !dbg !74
  %cmp = icmp eq i32 %0, 5, !dbg !75
  %conv = zext i1 %cmp to i32, !dbg !75
  call void @__VERIFIER_assert(i32 %conv), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !77, metadata !DIExpression()), !dbg !78
  %1 = load i32, i32* @glob1, align 4, !dbg !79
  %add = add nsw i32 %1, 1, !dbg !80
  store i32 %add, i32* %tmp, align 4, !dbg !78
  %2 = load i32, i32* %tmp, align 4, !dbg !81
  store i32 %2, i32* @glob1, align 4, !dbg !82
  %3 = load i32, i32* @glob1, align 4, !dbg !83
  %cmp1 = icmp eq i32 %3, 6, !dbg !84
  %conv2 = zext i1 %cmp1 to i32, !dbg !84
  call void @__VERIFIER_assert(i32 %conv2), !dbg !85
  call void @llvm.dbg.declare(metadata i32* %tmp1, metadata !86, metadata !DIExpression()), !dbg !87
  %4 = load i32, i32* @glob1, align 4, !dbg !88
  %sub = sub nsw i32 %4, 1, !dbg !89
  store i32 %sub, i32* %tmp1, align 4, !dbg !87
  %5 = load i32, i32* %tmp1, align 4, !dbg !90
  store i32 %5, i32* @glob1, align 4, !dbg !91
  ret i32 0, !dbg !92
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
!1 = distinct !DIGlobalVariable(name: "glob1", scope: !2, file: !6, line: 30, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_600_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_600_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "reach_error", scope: !6, file: !6, line: 2, type: !15, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocation(line: 2, column: 22, scope: !14)
!18 = !DILocation(line: 2, column: 33, scope: !14)
!19 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !6, file: !6, line: 5, type: !20, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !7}
!22 = !DILocalVariable(name: "cond", arg: 1, scope: !19, file: !6, line: 5, type: !7)
!23 = !DILocation(line: 5, column: 28, scope: !19)
!24 = !DILocation(line: 7, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !19, file: !6, line: 7, column: 7)
!26 = !DILocation(line: 7, column: 8, scope: !25)
!27 = !DILocation(line: 7, column: 7, scope: !19)
!28 = !DILocation(line: 8, column: 3, scope: !25)
!29 = !DILabel(scope: !30, name: "ERROR", file: !6, line: 9)
!30 = distinct !DILexicalBlock(scope: !25, file: !6, line: 8, column: 3)
!31 = !DILocation(line: 9, column: 3, scope: !30)
!32 = !DILocation(line: 11, column: 5, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !6, line: 10, column: 3)
!34 = !DILocation(line: 12, column: 5, scope: !33)
!35 = !DILocation(line: 15, column: 1, scope: !19)
!36 = distinct !DISubprogram(name: "isr__VERIFIER_assert", scope: !6, file: !6, line: 18, type: !20, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DILocalVariable(name: "cond", arg: 1, scope: !36, file: !6, line: 18, type: !7)
!38 = !DILocation(line: 18, column: 31, scope: !36)
!39 = !DILocation(line: 20, column: 9, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !6, line: 20, column: 7)
!41 = !DILocation(line: 20, column: 8, scope: !40)
!42 = !DILocation(line: 20, column: 7, scope: !36)
!43 = !DILocation(line: 21, column: 3, scope: !40)
!44 = !DILabel(scope: !45, name: "ERROR", file: !6, line: 22)
!45 = distinct !DILexicalBlock(scope: !40, file: !6, line: 21, column: 3)
!46 = !DILocation(line: 22, column: 3, scope: !45)
!47 = !DILocation(line: 24, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !6, line: 23, column: 3)
!49 = !DILocation(line: 25, column: 5, scope: !48)
!50 = !DILocation(line: 28, column: 1, scope: !36)
!51 = distinct !DISubprogram(name: "svp_simple_600_001_isr_1", scope: !6, file: !6, line: 32, type: !52, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{null, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!55 = !DILocalVariable(name: "arg", arg: 1, scope: !51, file: !6, line: 32, type: !54)
!56 = !DILocation(line: 32, column: 37, scope: !51)
!57 = !DILocalVariable(name: "t", scope: !51, file: !6, line: 34, type: !7)
!58 = !DILocation(line: 34, column: 7, scope: !51)
!59 = !DILocation(line: 35, column: 7, scope: !51)
!60 = !DILocation(line: 35, column: 5, scope: !51)
!61 = !DILocation(line: 36, column: 24, scope: !51)
!62 = !DILocation(line: 36, column: 26, scope: !51)
!63 = !DILocation(line: 36, column: 3, scope: !51)
!64 = !DILocation(line: 37, column: 9, scope: !51)
!65 = !DILocation(line: 38, column: 24, scope: !51)
!66 = !DILocation(line: 38, column: 30, scope: !51)
!67 = !DILocation(line: 38, column: 3, scope: !51)
!68 = !DILocation(line: 39, column: 11, scope: !51)
!69 = !DILocation(line: 39, column: 9, scope: !51)
!70 = !DILocation(line: 40, column: 1, scope: !51)
!71 = distinct !DISubprogram(name: "svp_simple_600_001_main", scope: !6, file: !6, line: 42, type: !72, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DISubroutineType(types: !73)
!73 = !{!7}
!74 = !DILocation(line: 45, column: 21, scope: !71)
!75 = !DILocation(line: 45, column: 27, scope: !71)
!76 = !DILocation(line: 45, column: 3, scope: !71)
!77 = !DILocalVariable(name: "tmp", scope: !71, file: !6, line: 46, type: !7)
!78 = !DILocation(line: 46, column: 7, scope: !71)
!79 = !DILocation(line: 46, column: 13, scope: !71)
!80 = !DILocation(line: 46, column: 19, scope: !71)
!81 = !DILocation(line: 47, column: 11, scope: !71)
!82 = !DILocation(line: 47, column: 9, scope: !71)
!83 = !DILocation(line: 49, column: 21, scope: !71)
!84 = !DILocation(line: 49, column: 27, scope: !71)
!85 = !DILocation(line: 49, column: 3, scope: !71)
!86 = !DILocalVariable(name: "tmp1", scope: !71, file: !6, line: 50, type: !7)
!87 = !DILocation(line: 50, column: 7, scope: !71)
!88 = !DILocation(line: 50, column: 14, scope: !71)
!89 = !DILocation(line: 50, column: 20, scope: !71)
!90 = !DILocation(line: 51, column: 11, scope: !71)
!91 = !DILocation(line: 51, column: 9, scope: !71)
!92 = !DILocation(line: 54, column: 3, scope: !71)
