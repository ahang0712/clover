; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/claude-3.5-sonnet/svp_simple_703_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_703_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() local_unnamed_addr #0 !dbg !9 {
entry:
  %call = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !13
  ret void, !dbg !14
}

declare i32 @assert(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %cond) local_unnamed_addr #0 !dbg !15 {
entry:
  %cond.addr = alloca i32, align 4
  store i32 %cond, i32* %cond.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cond.addr, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i32, i32* %cond.addr, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !23
  br i1 %tobool, label %if.end, label %if.then, !dbg !24

if.then:                                          ; preds = %entry
  br label %ERROR, !dbg !25

ERROR:                                            ; preds = %if.then
  call void @llvm.dbg.label(metadata !26), !dbg !28
  call void @reach_error(), !dbg !29
  call void @abort() #4, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  ret void, !dbg !32
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_703_001_isr_1(i8* %arg) local_unnamed_addr #0 !dbg !33 {
entry:
  %arg.addr = alloca i8*, align 8
  %x = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32* %x, metadata !39, metadata !DIExpression()), !dbg !40
  %call = call i32 (...) @__VERIFIER_nondet_int(), !dbg !41
  store i32 %call, i32* %x, align 4, !dbg !40
  %0 = load i32, i32* %x, align 4, !dbg !42
  %cmp = icmp eq i32 %0, 3, !dbg !43
  %lnot = xor i1 %cmp, true, !dbg !44
  %lnot.ext = zext i1 %lnot to i32, !dbg !44
  call void @__VERIFIER_assert(i32 %lnot.ext), !dbg !45
  ret void, !dbg !46
}

declare i32 @__VERIFIER_nondet_int(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_703_001_main() local_unnamed_addr #0 !dbg !47 {
entry:
  %x = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 3, i32* %x, align 4, !dbg !51
  ret i32 0, !dbg !52
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.dbg.cu = !{!5}
!llvm.ident = !{!8}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!1 = !{i32 7, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 7, !"PIC Level", i32 2}
!5 = distinct !DICompileUnit(language: DW_LANG_C99, file: !6, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !7, nameTableKind: None)
!6 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_703_001.c", directory: "/Users/hehang03/code/clover")
!7 = !{}
!8 = !{!"clang version 10.0.0 "}
!9 = distinct !DISubprogram(name: "reach_error", scope: !10, file: !10, line: 2, type: !11, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!10 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_703_001.c", directory: "/Users/hehang03/code/clover")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocation(line: 2, column: 22, scope: !9)
!14 = !DILocation(line: 2, column: 33, scope: !9)
!15 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !10, file: !10, line: 3, type: !16, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!16 = !DISubroutineType(types: !17)
!17 = !{null, !18}
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "cond", arg: 1, scope: !15, file: !10, line: 3, type: !18)
!20 = !DILocation(line: 3, column: 28, scope: !15)
!21 = !DILocation(line: 3, column: 41, scope: !22)
!22 = distinct !DILexicalBlock(scope: !15, file: !10, line: 3, column: 39)
!23 = !DILocation(line: 3, column: 40, scope: !22)
!24 = !DILocation(line: 3, column: 39, scope: !15)
!25 = !DILocation(line: 3, column: 48, scope: !22)
!26 = !DILabel(scope: !27, name: "ERROR", file: !10, line: 3)
!27 = distinct !DILexicalBlock(scope: !22, file: !10, line: 3, column: 48)
!28 = !DILocation(line: 3, column: 50, scope: !27)
!29 = !DILocation(line: 3, column: 58, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !10, line: 3, column: 57)
!31 = !DILocation(line: 3, column: 72, scope: !30)
!32 = !DILocation(line: 3, column: 84, scope: !15)
!33 = distinct !DISubprogram(name: "svp_simple_703_001_isr_1", scope: !10, file: !10, line: 9, type: !34, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!34 = !DISubroutineType(types: !35)
!35 = !{null, !36}
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!37 = !DILocalVariable(name: "arg", arg: 1, scope: !33, file: !10, line: 9, type: !36)
!38 = !DILocation(line: 9, column: 37, scope: !33)
!39 = !DILocalVariable(name: "x", scope: !33, file: !10, line: 10, type: !18)
!40 = !DILocation(line: 10, column: 7, scope: !33)
!41 = !DILocation(line: 10, column: 11, scope: !33)
!42 = !DILocation(line: 11, column: 23, scope: !33)
!43 = !DILocation(line: 11, column: 25, scope: !33)
!44 = !DILocation(line: 11, column: 21, scope: !33)
!45 = !DILocation(line: 11, column: 3, scope: !33)
!46 = !DILocation(line: 13, column: 1, scope: !33)
!47 = distinct !DISubprogram(name: "svp_simple_703_001_main", scope: !10, file: !10, line: 15, type: !48, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!48 = !DISubroutineType(types: !49)
!49 = !{!18}
!50 = !DILocalVariable(name: "x", scope: !47, file: !10, line: 16, type: !18)
!51 = !DILocation(line: 16, column: 7, scope: !47)
!52 = !DILocation(line: 19, column: 3, scope: !47)
