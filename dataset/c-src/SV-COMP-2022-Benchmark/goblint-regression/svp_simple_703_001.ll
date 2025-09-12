; ModuleID = 'svp_simple_703_001.c'
source_filename = "svp_simple_703_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() #0 !dbg !8 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !11
  ret void, !dbg !12
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !13 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !17, metadata !DIExpression()), !dbg !18
  %3 = load i32, i32* %2, align 4, !dbg !19
  %4 = icmp ne i32 %3, 0, !dbg !21
  br i1 %4, label %7, label %5, !dbg !22

5:                                                ; preds = %1
  br label %6, !dbg !23

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !24), !dbg !26
  call void @reach_error(), !dbg !27
  call void @abort() #4, !dbg !29
  unreachable, !dbg !29

7:                                                ; preds = %1
  ret void, !dbg !30
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_703_001_isr_1(i8* %0) #0 !dbg !31 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i32* %3, metadata !37, metadata !DIExpression()), !dbg !38
  %4 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !39
  store i32 %4, i32* %3, align 4, !dbg !38
  %5 = load i32, i32* %3, align 4, !dbg !40
  %6 = icmp eq i32 %5, 3, !dbg !41
  %7 = xor i1 %6, true, !dbg !42
  %8 = zext i1 %7 to i32, !dbg !42
  call void @__VERIFIER_assert(i32 %8), !dbg !43
  ret void, !dbg !44
}

declare i32 @__VERIFIER_nondet_int(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_703_001_main() #0 !dbg !45 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 3, i32* %1, align 4, !dbg !49
  ret i32 0, !dbg !50
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
!1 = !DIFile(filename: "svp_simple_703_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 10.0.0 "}
!8 = distinct !DISubprogram(name: "reach_error", scope: !1, file: !1, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{null}
!11 = !DILocation(line: 2, column: 22, scope: !8)
!12 = !DILocation(line: 2, column: 33, scope: !8)
!13 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !1, file: !1, line: 3, type: !14, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16}
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "cond", arg: 1, scope: !13, file: !1, line: 3, type: !16)
!18 = !DILocation(line: 3, column: 28, scope: !13)
!19 = !DILocation(line: 3, column: 41, scope: !20)
!20 = distinct !DILexicalBlock(scope: !13, file: !1, line: 3, column: 39)
!21 = !DILocation(line: 3, column: 40, scope: !20)
!22 = !DILocation(line: 3, column: 39, scope: !13)
!23 = !DILocation(line: 3, column: 48, scope: !20)
!24 = !DILabel(scope: !25, name: "ERROR", file: !1, line: 3)
!25 = distinct !DILexicalBlock(scope: !20, file: !1, line: 3, column: 48)
!26 = !DILocation(line: 3, column: 50, scope: !25)
!27 = !DILocation(line: 3, column: 58, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !1, line: 3, column: 57)
!29 = !DILocation(line: 3, column: 72, scope: !28)
!30 = !DILocation(line: 3, column: 84, scope: !13)
!31 = distinct !DISubprogram(name: "svp_simple_703_001_isr_1", scope: !1, file: !1, line: 9, type: !32, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{null, !34}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!35 = !DILocalVariable(name: "arg", arg: 1, scope: !31, file: !1, line: 9, type: !34)
!36 = !DILocation(line: 9, column: 37, scope: !31)
!37 = !DILocalVariable(name: "x", scope: !31, file: !1, line: 10, type: !16)
!38 = !DILocation(line: 10, column: 7, scope: !31)
!39 = !DILocation(line: 10, column: 11, scope: !31)
!40 = !DILocation(line: 11, column: 23, scope: !31)
!41 = !DILocation(line: 11, column: 25, scope: !31)
!42 = !DILocation(line: 11, column: 21, scope: !31)
!43 = !DILocation(line: 11, column: 3, scope: !31)
!44 = !DILocation(line: 13, column: 1, scope: !31)
!45 = distinct !DISubprogram(name: "svp_simple_703_001_main", scope: !1, file: !1, line: 15, type: !46, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!16}
!48 = !DILocalVariable(name: "x", scope: !45, file: !1, line: 16, type: !16)
!49 = !DILocation(line: 16, column: 7, scope: !45)
!50 = !DILocation(line: 19, column: 3, scope: !45)
