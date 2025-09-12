; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_703_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_703_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() #0 !dbg !8 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !12
  ret void, !dbg !13
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !14 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !18, metadata !DIExpression()), !dbg !19
  %3 = load i32, i32* %2, align 4, !dbg !20
  %4 = icmp ne i32 %3, 0, !dbg !22
  br i1 %4, label %7, label %5, !dbg !23

5:                                                ; preds = %1
  br label %6, !dbg !24

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !25), !dbg !27
  call void @reach_error(), !dbg !28
  call void @abort() #4, !dbg !30
  unreachable, !dbg !30

7:                                                ; preds = %1
  ret void, !dbg !31
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_703_001_isr_1(i8* %0) #0 !dbg !32 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %3, metadata !38, metadata !DIExpression()), !dbg !39
  %4 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !40
  store i32 %4, i32* %3, align 4, !dbg !39
  %5 = load i32, i32* %3, align 4, !dbg !41
  %6 = icmp eq i32 %5, 3, !dbg !42
  %7 = xor i1 %6, true, !dbg !43
  %8 = zext i1 %7 to i32, !dbg !43
  call void @__VERIFIER_assert(i32 %8), !dbg !44
  ret void, !dbg !45
}

declare i32 @__VERIFIER_nondet_int(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_703_001_main() #0 !dbg !46 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 3, i32* %1, align 4, !dbg !50
  ret i32 0, !dbg !51
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_703_001.c", directory: "/Users/hehang03/code/clover")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 10.0.0 "}
!8 = distinct !DISubprogram(name: "reach_error", scope: !9, file: !9, line: 2, type: !10, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!9 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_703_001.c", directory: "/Users/hehang03/code/clover")
!10 = !DISubroutineType(types: !11)
!11 = !{null}
!12 = !DILocation(line: 2, column: 22, scope: !8)
!13 = !DILocation(line: 2, column: 33, scope: !8)
!14 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !9, file: !9, line: 3, type: !15, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "cond", arg: 1, scope: !14, file: !9, line: 3, type: !17)
!19 = !DILocation(line: 3, column: 28, scope: !14)
!20 = !DILocation(line: 3, column: 41, scope: !21)
!21 = distinct !DILexicalBlock(scope: !14, file: !9, line: 3, column: 39)
!22 = !DILocation(line: 3, column: 40, scope: !21)
!23 = !DILocation(line: 3, column: 39, scope: !14)
!24 = !DILocation(line: 3, column: 48, scope: !21)
!25 = !DILabel(scope: !26, name: "ERROR", file: !9, line: 3)
!26 = distinct !DILexicalBlock(scope: !21, file: !9, line: 3, column: 48)
!27 = !DILocation(line: 3, column: 50, scope: !26)
!28 = !DILocation(line: 3, column: 58, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !9, line: 3, column: 57)
!30 = !DILocation(line: 3, column: 72, scope: !29)
!31 = !DILocation(line: 3, column: 84, scope: !14)
!32 = distinct !DISubprogram(name: "svp_simple_703_001_isr_1", scope: !9, file: !9, line: 9, type: !33, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{null, !35}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!36 = !DILocalVariable(name: "arg", arg: 1, scope: !32, file: !9, line: 9, type: !35)
!37 = !DILocation(line: 9, column: 37, scope: !32)
!38 = !DILocalVariable(name: "x", scope: !32, file: !9, line: 10, type: !17)
!39 = !DILocation(line: 10, column: 7, scope: !32)
!40 = !DILocation(line: 10, column: 11, scope: !32)
!41 = !DILocation(line: 11, column: 23, scope: !32)
!42 = !DILocation(line: 11, column: 25, scope: !32)
!43 = !DILocation(line: 11, column: 21, scope: !32)
!44 = !DILocation(line: 11, column: 3, scope: !32)
!45 = !DILocation(line: 13, column: 1, scope: !32)
!46 = distinct !DISubprogram(name: "svp_simple_703_001_main", scope: !9, file: !9, line: 15, type: !47, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!17}
!49 = !DILocalVariable(name: "x", scope: !46, file: !9, line: 16, type: !17)
!50 = !DILocation(line: 16, column: 7, scope: !46)
!51 = !DILocation(line: 19, column: 3, scope: !46)
