; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_600_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_600_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@glob1 = global i32 5, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() #0 !dbg !13 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !16
  ret void, !dbg !17
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !18 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !21, metadata !DIExpression()), !dbg !22
  %3 = load i32, i32* %2, align 4, !dbg !23
  %4 = icmp ne i32 %3, 0, !dbg !25
  br i1 %4, label %7, label %5, !dbg !26

5:                                                ; preds = %1
  br label %6, !dbg !27

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !28), !dbg !30
  call void @reach_error(), !dbg !31
  call void @abort() #4, !dbg !33
  unreachable, !dbg !33

7:                                                ; preds = %1
  ret void, !dbg !34
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @isr__VERIFIER_assert(i32 %0) #0 !dbg !35 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !36, metadata !DIExpression()), !dbg !37
  %3 = load i32, i32* %2, align 4, !dbg !38
  %4 = icmp ne i32 %3, 0, !dbg !40
  br i1 %4, label %7, label %5, !dbg !41

5:                                                ; preds = %1
  br label %6, !dbg !42

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !43), !dbg !45
  call void @reach_error(), !dbg !46
  call void @abort() #4, !dbg !48
  unreachable, !dbg !48

7:                                                ; preds = %1
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_600_001_isr_1(i8* %0) #0 !dbg !50 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i32* %3, metadata !56, metadata !DIExpression()), !dbg !57
  %4 = load i32, i32* @glob1, align 4, !dbg !58
  store i32 %4, i32* %3, align 4, !dbg !59
  %5 = load i32, i32* %3, align 4, !dbg !60
  %6 = icmp eq i32 %5, 5, !dbg !61
  %7 = zext i1 %6 to i32, !dbg !61
  call void @isr__VERIFIER_assert(i32 %7), !dbg !62
  store i32 -10, i32* @glob1, align 4, !dbg !63
  %8 = load i32, i32* @glob1, align 4, !dbg !64
  %9 = icmp eq i32 %8, -10, !dbg !65
  %10 = zext i1 %9 to i32, !dbg !65
  call void @isr__VERIFIER_assert(i32 %10), !dbg !66
  %11 = load i32, i32* %3, align 4, !dbg !67
  store i32 %11, i32* @glob1, align 4, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_600_001_main() #0 !dbg !70 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = load i32, i32* @glob1, align 4, !dbg !73
  %4 = icmp eq i32 %3, 5, !dbg !74
  %5 = zext i1 %4 to i32, !dbg !74
  call void @__VERIFIER_assert(i32 %5), !dbg !75
  call void @llvm.dbg.declare(metadata i32* %1, metadata !76, metadata !DIExpression()), !dbg !77
  %6 = load i32, i32* @glob1, align 4, !dbg !78
  %7 = add nsw i32 %6, 1, !dbg !79
  store i32 %7, i32* %1, align 4, !dbg !77
  %8 = load i32, i32* %1, align 4, !dbg !80
  store i32 %8, i32* @glob1, align 4, !dbg !81
  %9 = load i32, i32* @glob1, align 4, !dbg !82
  %10 = icmp eq i32 %9, 6, !dbg !83
  %11 = zext i1 %10 to i32, !dbg !83
  call void @__VERIFIER_assert(i32 %11), !dbg !84
  call void @llvm.dbg.declare(metadata i32* %2, metadata !85, metadata !DIExpression()), !dbg !86
  %12 = load i32, i32* @glob1, align 4, !dbg !87
  %13 = sub nsw i32 %12, 1, !dbg !88
  store i32 %13, i32* %2, align 4, !dbg !86
  %14 = load i32, i32* %2, align 4, !dbg !89
  store i32 %14, i32* @glob1, align 4, !dbg !90
  ret i32 0, !dbg !91
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "glob1", scope: !2, file: !6, line: 30, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_600_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_600_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{!"clang version 10.0.0 "}
!13 = distinct !DISubprogram(name: "reach_error", scope: !6, file: !6, line: 2, type: !14, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocation(line: 2, column: 22, scope: !13)
!17 = !DILocation(line: 2, column: 33, scope: !13)
!18 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !6, file: !6, line: 5, type: !19, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !7}
!21 = !DILocalVariable(name: "cond", arg: 1, scope: !18, file: !6, line: 5, type: !7)
!22 = !DILocation(line: 5, column: 28, scope: !18)
!23 = !DILocation(line: 7, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !18, file: !6, line: 7, column: 7)
!25 = !DILocation(line: 7, column: 8, scope: !24)
!26 = !DILocation(line: 7, column: 7, scope: !18)
!27 = !DILocation(line: 8, column: 3, scope: !24)
!28 = !DILabel(scope: !29, name: "ERROR", file: !6, line: 9)
!29 = distinct !DILexicalBlock(scope: !24, file: !6, line: 8, column: 3)
!30 = !DILocation(line: 9, column: 3, scope: !29)
!31 = !DILocation(line: 11, column: 5, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !6, line: 10, column: 3)
!33 = !DILocation(line: 12, column: 5, scope: !32)
!34 = !DILocation(line: 15, column: 1, scope: !18)
!35 = distinct !DISubprogram(name: "isr__VERIFIER_assert", scope: !6, file: !6, line: 18, type: !19, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DILocalVariable(name: "cond", arg: 1, scope: !35, file: !6, line: 18, type: !7)
!37 = !DILocation(line: 18, column: 31, scope: !35)
!38 = !DILocation(line: 20, column: 9, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !6, line: 20, column: 7)
!40 = !DILocation(line: 20, column: 8, scope: !39)
!41 = !DILocation(line: 20, column: 7, scope: !35)
!42 = !DILocation(line: 21, column: 3, scope: !39)
!43 = !DILabel(scope: !44, name: "ERROR", file: !6, line: 22)
!44 = distinct !DILexicalBlock(scope: !39, file: !6, line: 21, column: 3)
!45 = !DILocation(line: 22, column: 3, scope: !44)
!46 = !DILocation(line: 24, column: 5, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !6, line: 23, column: 3)
!48 = !DILocation(line: 25, column: 5, scope: !47)
!49 = !DILocation(line: 28, column: 1, scope: !35)
!50 = distinct !DISubprogram(name: "svp_simple_600_001_isr_1", scope: !6, file: !6, line: 32, type: !51, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DISubroutineType(types: !52)
!52 = !{null, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!54 = !DILocalVariable(name: "arg", arg: 1, scope: !50, file: !6, line: 32, type: !53)
!55 = !DILocation(line: 32, column: 37, scope: !50)
!56 = !DILocalVariable(name: "t", scope: !50, file: !6, line: 34, type: !7)
!57 = !DILocation(line: 34, column: 7, scope: !50)
!58 = !DILocation(line: 35, column: 7, scope: !50)
!59 = !DILocation(line: 35, column: 5, scope: !50)
!60 = !DILocation(line: 36, column: 24, scope: !50)
!61 = !DILocation(line: 36, column: 26, scope: !50)
!62 = !DILocation(line: 36, column: 3, scope: !50)
!63 = !DILocation(line: 37, column: 9, scope: !50)
!64 = !DILocation(line: 38, column: 24, scope: !50)
!65 = !DILocation(line: 38, column: 30, scope: !50)
!66 = !DILocation(line: 38, column: 3, scope: !50)
!67 = !DILocation(line: 39, column: 11, scope: !50)
!68 = !DILocation(line: 39, column: 9, scope: !50)
!69 = !DILocation(line: 40, column: 1, scope: !50)
!70 = distinct !DISubprogram(name: "svp_simple_600_001_main", scope: !6, file: !6, line: 42, type: !71, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DISubroutineType(types: !72)
!72 = !{!7}
!73 = !DILocation(line: 45, column: 21, scope: !70)
!74 = !DILocation(line: 45, column: 27, scope: !70)
!75 = !DILocation(line: 45, column: 3, scope: !70)
!76 = !DILocalVariable(name: "tmp", scope: !70, file: !6, line: 46, type: !7)
!77 = !DILocation(line: 46, column: 7, scope: !70)
!78 = !DILocation(line: 46, column: 13, scope: !70)
!79 = !DILocation(line: 46, column: 19, scope: !70)
!80 = !DILocation(line: 47, column: 11, scope: !70)
!81 = !DILocation(line: 47, column: 9, scope: !70)
!82 = !DILocation(line: 49, column: 21, scope: !70)
!83 = !DILocation(line: 49, column: 27, scope: !70)
!84 = !DILocation(line: 49, column: 3, scope: !70)
!85 = !DILocalVariable(name: "tmp1", scope: !70, file: !6, line: 50, type: !7)
!86 = !DILocation(line: 50, column: 7, scope: !70)
!87 = !DILocation(line: 50, column: 14, scope: !70)
!88 = !DILocation(line: 50, column: 20, scope: !70)
!89 = !DILocation(line: 51, column: 11, scope: !70)
!90 = !DILocation(line: 51, column: 9, scope: !70)
!91 = !DILocation(line: 54, column: 3, scope: !70)
