; ModuleID = 'svp_simple_606_001.c'
source_filename = "svp_simple_606_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@glob1 = global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() #0 !dbg !12 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !15
  ret void, !dbg !16
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !17 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !20, metadata !DIExpression()), !dbg !21
  %3 = load i32, i32* %2, align 4, !dbg !22
  %4 = icmp ne i32 %3, 0, !dbg !24
  br i1 %4, label %7, label %5, !dbg !25

5:                                                ; preds = %1
  br label %6, !dbg !26

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !27), !dbg !29
  call void @reach_error(), !dbg !30
  call void @abort() #4, !dbg !32
  unreachable, !dbg !32

7:                                                ; preds = %1
  ret void, !dbg !33
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_606_001_isr_1(i8* %0) #0 !dbg !34 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %3, metadata !40, metadata !DIExpression()), !dbg !41
  %4 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !42
  store i32 %4, i32* %3, align 4, !dbg !41
  %5 = load i32, i32* %3, align 4, !dbg !43
  %6 = icmp eq i32 %5, 42, !dbg !45
  br i1 %6, label %7, label %8, !dbg !46

7:                                                ; preds = %1
  store i32 1, i32* @glob1, align 4, !dbg !47
  br label %8, !dbg !49

8:                                                ; preds = %7, %1
  %9 = load i32, i32* @glob1, align 4, !dbg !50
  store i32 %9, i32* %3, align 4, !dbg !51
  %10 = load i32, i32* %3, align 4, !dbg !52
  %11 = icmp eq i32 %10, 1, !dbg !53
  %12 = xor i1 %11, true, !dbg !54
  %13 = zext i1 %12 to i32, !dbg !54
  call void @__VERIFIER_assert(i32 %13), !dbg !55
  store i32 0, i32* @glob1, align 4, !dbg !56
  ret void, !dbg !57
}

declare i32 @__VERIFIER_nondet_int(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_606_001_main() #0 !dbg !58 {
  ret i32 0, !dbg !61
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "glob1", scope: !2, file: !3, line: 9, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_606_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{!"clang version 10.0.0 "}
!12 = distinct !DISubprogram(name: "reach_error", scope: !3, file: !3, line: 2, type: !13, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 2, column: 22, scope: !12)
!16 = !DILocation(line: 2, column: 33, scope: !12)
!17 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !3, file: !3, line: 3, type: !18, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null, !6}
!20 = !DILocalVariable(name: "cond", arg: 1, scope: !17, file: !3, line: 3, type: !6)
!21 = !DILocation(line: 3, column: 28, scope: !17)
!22 = !DILocation(line: 3, column: 41, scope: !23)
!23 = distinct !DILexicalBlock(scope: !17, file: !3, line: 3, column: 39)
!24 = !DILocation(line: 3, column: 40, scope: !23)
!25 = !DILocation(line: 3, column: 39, scope: !17)
!26 = !DILocation(line: 3, column: 48, scope: !23)
!27 = !DILabel(scope: !28, name: "ERROR", file: !3, line: 3)
!28 = distinct !DILexicalBlock(scope: !23, file: !3, line: 3, column: 48)
!29 = !DILocation(line: 3, column: 50, scope: !28)
!30 = !DILocation(line: 3, column: 58, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !3, line: 3, column: 57)
!32 = !DILocation(line: 3, column: 72, scope: !31)
!33 = !DILocation(line: 3, column: 84, scope: !17)
!34 = distinct !DISubprogram(name: "svp_simple_606_001_isr_1", scope: !3, file: !3, line: 11, type: !35, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!35 = !DISubroutineType(types: !36)
!36 = !{null, !37}
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!38 = !DILocalVariable(name: "arg", arg: 1, scope: !34, file: !3, line: 11, type: !37)
!39 = !DILocation(line: 11, column: 37, scope: !34)
!40 = !DILocalVariable(name: "t", scope: !34, file: !3, line: 12, type: !6)
!41 = !DILocation(line: 12, column: 7, scope: !34)
!42 = !DILocation(line: 12, column: 11, scope: !34)
!43 = !DILocation(line: 14, column: 6, scope: !44)
!44 = distinct !DILexicalBlock(scope: !34, file: !3, line: 14, column: 6)
!45 = !DILocation(line: 14, column: 8, scope: !44)
!46 = !DILocation(line: 14, column: 6, scope: !34)
!47 = !DILocation(line: 15, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !3, line: 14, column: 15)
!49 = !DILocation(line: 16, column: 3, scope: !48)
!50 = !DILocation(line: 17, column: 7, scope: !34)
!51 = !DILocation(line: 17, column: 5, scope: !34)
!52 = !DILocation(line: 20, column: 23, scope: !34)
!53 = !DILocation(line: 20, column: 25, scope: !34)
!54 = !DILocation(line: 20, column: 21, scope: !34)
!55 = !DILocation(line: 20, column: 3, scope: !34)
!56 = !DILocation(line: 22, column: 9, scope: !34)
!57 = !DILocation(line: 24, column: 1, scope: !34)
!58 = distinct !DISubprogram(name: "svp_simple_606_001_main", scope: !3, file: !3, line: 26, type: !59, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!6}
!61 = !DILocation(line: 28, column: 3, scope: !58)
