; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/kimi/svp_simple_635_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_635_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g = local_unnamed_addr global i32 0, align 4, !dbg !0

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
define void @svp_simple_635_001_isr1(i8* %arg) local_unnamed_addr #0 !dbg !36 {
entry:
  %arg.addr = alloca i8*, align 8
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !40, metadata !DIExpression()), !dbg !41
  store i32 1000, i32* @g, align 4, !dbg !42
  %0 = load i32, i32* @g, align 4, !dbg !43
  %cmp = icmp ne i32 %0, 0, !dbg !44
  %conv = zext i1 %cmp to i32, !dbg !44
  call void @__VERIFIER_assert(i32 %conv), !dbg !45
  %1 = load i32, i32* @g, align 4, !dbg !46
  %cmp1 = icmp sgt i32 %1, 0, !dbg !48
  br i1 %cmp1, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @g, align 4, !dbg !50
  %dec = add nsw i32 %2, -1, !dbg !50
  store i32 %dec, i32* @g, align 4, !dbg !50
  br label %if.end, !dbg !52

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_635_001_main(i32 %argc, i8** %argv) local_unnamed_addr #0 !dbg !54 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  ret i32 0, !dbg !64
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
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !6, line: 8, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_635_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_635_001.c", directory: "/Users/hehang03/code/clover")
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
!19 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !6, file: !6, line: 4, type: !20, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !7}
!22 = !DILocalVariable(name: "cond", arg: 1, scope: !19, file: !6, line: 4, type: !7)
!23 = !DILocation(line: 4, column: 28, scope: !19)
!24 = !DILocation(line: 4, column: 41, scope: !25)
!25 = distinct !DILexicalBlock(scope: !19, file: !6, line: 4, column: 39)
!26 = !DILocation(line: 4, column: 40, scope: !25)
!27 = !DILocation(line: 4, column: 39, scope: !19)
!28 = !DILocation(line: 4, column: 48, scope: !25)
!29 = !DILabel(scope: !30, name: "ERROR", file: !6, line: 4)
!30 = distinct !DILexicalBlock(scope: !25, file: !6, line: 4, column: 48)
!31 = !DILocation(line: 4, column: 50, scope: !30)
!32 = !DILocation(line: 4, column: 58, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !6, line: 4, column: 57)
!34 = !DILocation(line: 4, column: 72, scope: !33)
!35 = !DILocation(line: 4, column: 84, scope: !19)
!36 = distinct !DISubprogram(name: "svp_simple_635_001_isr1", scope: !6, file: !6, line: 12, type: !37, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!40 = !DILocalVariable(name: "arg", arg: 1, scope: !36, file: !6, line: 12, type: !39)
!41 = !DILocation(line: 12, column: 36, scope: !36)
!42 = !DILocation(line: 15, column: 7, scope: !36)
!43 = !DILocation(line: 16, column: 23, scope: !36)
!44 = !DILocation(line: 16, column: 25, scope: !36)
!45 = !DILocation(line: 16, column: 5, scope: !36)
!46 = !DILocation(line: 17, column: 9, scope: !47)
!47 = distinct !DILexicalBlock(scope: !36, file: !6, line: 17, column: 9)
!48 = !DILocation(line: 17, column: 11, scope: !47)
!49 = !DILocation(line: 17, column: 9, scope: !36)
!50 = !DILocation(line: 18, column: 8, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !6, line: 17, column: 16)
!52 = !DILocation(line: 19, column: 5, scope: !51)
!53 = !DILocation(line: 22, column: 1, scope: !36)
!54 = distinct !DISubprogram(name: "svp_simple_635_001_main", scope: !6, file: !6, line: 24, type: !55, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!7, !7, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !6, line: 24, type: !7)
!61 = !DILocation(line: 24, column: 33, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !6, line: 24, type: !57)
!63 = !DILocation(line: 24, column: 47, scope: !54)
!64 = !DILocation(line: 27, column: 3, scope: !54)
