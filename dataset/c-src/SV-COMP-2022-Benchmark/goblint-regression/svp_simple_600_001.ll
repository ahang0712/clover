; ModuleID = 'svp_simple_600_001.c'
source_filename = "svp_simple_600_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@glob1 = global i32 5, align 4, !dbg !0

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
define void @isr__VERIFIER_assert(i32 %0) #0 !dbg !34 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !35, metadata !DIExpression()), !dbg !36
  %3 = load i32, i32* %2, align 4, !dbg !37
  %4 = icmp ne i32 %3, 0, !dbg !39
  br i1 %4, label %7, label %5, !dbg !40

5:                                                ; preds = %1
  br label %6, !dbg !41

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !42), !dbg !44
  call void @reach_error(), !dbg !45
  call void @abort() #4, !dbg !47
  unreachable, !dbg !47

7:                                                ; preds = %1
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_600_001_isr_1(i8* %0) #0 !dbg !49 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i32* %3, metadata !55, metadata !DIExpression()), !dbg !56
  %4 = load i32, i32* @glob1, align 4, !dbg !57
  store i32 %4, i32* %3, align 4, !dbg !58
  %5 = load i32, i32* %3, align 4, !dbg !59
  %6 = icmp eq i32 %5, 5, !dbg !60
  %7 = zext i1 %6 to i32, !dbg !60
  call void @isr__VERIFIER_assert(i32 %7), !dbg !61
  store i32 -10, i32* @glob1, align 4, !dbg !62
  %8 = load i32, i32* @glob1, align 4, !dbg !63
  %9 = icmp eq i32 %8, -10, !dbg !64
  %10 = zext i1 %9 to i32, !dbg !64
  call void @isr__VERIFIER_assert(i32 %10), !dbg !65
  %11 = load i32, i32* %3, align 4, !dbg !66
  store i32 %11, i32* @glob1, align 4, !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_600_001_main() #0 !dbg !69 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = load i32, i32* @glob1, align 4, !dbg !72
  %4 = icmp eq i32 %3, 5, !dbg !73
  %5 = zext i1 %4 to i32, !dbg !73
  call void @__VERIFIER_assert(i32 %5), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %1, metadata !75, metadata !DIExpression()), !dbg !76
  %6 = load i32, i32* @glob1, align 4, !dbg !77
  %7 = add nsw i32 %6, 1, !dbg !78
  store i32 %7, i32* %1, align 4, !dbg !76
  %8 = load i32, i32* %1, align 4, !dbg !79
  store i32 %8, i32* @glob1, align 4, !dbg !80
  %9 = load i32, i32* @glob1, align 4, !dbg !81
  %10 = icmp eq i32 %9, 6, !dbg !82
  %11 = zext i1 %10 to i32, !dbg !82
  call void @__VERIFIER_assert(i32 %11), !dbg !83
  call void @llvm.dbg.declare(metadata i32* %2, metadata !84, metadata !DIExpression()), !dbg !85
  %12 = load i32, i32* @glob1, align 4, !dbg !86
  %13 = sub nsw i32 %12, 1, !dbg !87
  store i32 %13, i32* %2, align 4, !dbg !85
  %14 = load i32, i32* %2, align 4, !dbg !88
  store i32 %14, i32* @glob1, align 4, !dbg !89
  ret i32 0, !dbg !90
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
!1 = distinct !DIGlobalVariable(name: "glob1", scope: !2, file: !3, line: 30, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_600_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
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
!17 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !3, file: !3, line: 5, type: !18, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null, !6}
!20 = !DILocalVariable(name: "cond", arg: 1, scope: !17, file: !3, line: 5, type: !6)
!21 = !DILocation(line: 5, column: 28, scope: !17)
!22 = !DILocation(line: 7, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !17, file: !3, line: 7, column: 7)
!24 = !DILocation(line: 7, column: 8, scope: !23)
!25 = !DILocation(line: 7, column: 7, scope: !17)
!26 = !DILocation(line: 8, column: 3, scope: !23)
!27 = !DILabel(scope: !28, name: "ERROR", file: !3, line: 9)
!28 = distinct !DILexicalBlock(scope: !23, file: !3, line: 8, column: 3)
!29 = !DILocation(line: 9, column: 3, scope: !28)
!30 = !DILocation(line: 11, column: 5, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !3, line: 10, column: 3)
!32 = !DILocation(line: 12, column: 5, scope: !31)
!33 = !DILocation(line: 15, column: 1, scope: !17)
!34 = distinct !DISubprogram(name: "isr__VERIFIER_assert", scope: !3, file: !3, line: 18, type: !18, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!35 = !DILocalVariable(name: "cond", arg: 1, scope: !34, file: !3, line: 18, type: !6)
!36 = !DILocation(line: 18, column: 31, scope: !34)
!37 = !DILocation(line: 20, column: 9, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !3, line: 20, column: 7)
!39 = !DILocation(line: 20, column: 8, scope: !38)
!40 = !DILocation(line: 20, column: 7, scope: !34)
!41 = !DILocation(line: 21, column: 3, scope: !38)
!42 = !DILabel(scope: !43, name: "ERROR", file: !3, line: 22)
!43 = distinct !DILexicalBlock(scope: !38, file: !3, line: 21, column: 3)
!44 = !DILocation(line: 22, column: 3, scope: !43)
!45 = !DILocation(line: 24, column: 5, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !3, line: 23, column: 3)
!47 = !DILocation(line: 25, column: 5, scope: !46)
!48 = !DILocation(line: 28, column: 1, scope: !34)
!49 = distinct !DISubprogram(name: "svp_simple_600_001_isr_1", scope: !3, file: !3, line: 32, type: !50, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DISubroutineType(types: !51)
!51 = !{null, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!53 = !DILocalVariable(name: "arg", arg: 1, scope: !49, file: !3, line: 32, type: !52)
!54 = !DILocation(line: 32, column: 37, scope: !49)
!55 = !DILocalVariable(name: "t", scope: !49, file: !3, line: 34, type: !6)
!56 = !DILocation(line: 34, column: 7, scope: !49)
!57 = !DILocation(line: 35, column: 7, scope: !49)
!58 = !DILocation(line: 35, column: 5, scope: !49)
!59 = !DILocation(line: 36, column: 24, scope: !49)
!60 = !DILocation(line: 36, column: 26, scope: !49)
!61 = !DILocation(line: 36, column: 3, scope: !49)
!62 = !DILocation(line: 37, column: 9, scope: !49)
!63 = !DILocation(line: 38, column: 24, scope: !49)
!64 = !DILocation(line: 38, column: 30, scope: !49)
!65 = !DILocation(line: 38, column: 3, scope: !49)
!66 = !DILocation(line: 39, column: 11, scope: !49)
!67 = !DILocation(line: 39, column: 9, scope: !49)
!68 = !DILocation(line: 40, column: 1, scope: !49)
!69 = distinct !DISubprogram(name: "svp_simple_600_001_main", scope: !3, file: !3, line: 42, type: !70, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DISubroutineType(types: !71)
!71 = !{!6}
!72 = !DILocation(line: 45, column: 21, scope: !69)
!73 = !DILocation(line: 45, column: 27, scope: !69)
!74 = !DILocation(line: 45, column: 3, scope: !69)
!75 = !DILocalVariable(name: "tmp", scope: !69, file: !3, line: 46, type: !6)
!76 = !DILocation(line: 46, column: 7, scope: !69)
!77 = !DILocation(line: 46, column: 13, scope: !69)
!78 = !DILocation(line: 46, column: 19, scope: !69)
!79 = !DILocation(line: 47, column: 11, scope: !69)
!80 = !DILocation(line: 47, column: 9, scope: !69)
!81 = !DILocation(line: 49, column: 21, scope: !69)
!82 = !DILocation(line: 49, column: 27, scope: !69)
!83 = !DILocation(line: 49, column: 3, scope: !69)
!84 = !DILocalVariable(name: "tmp1", scope: !69, file: !3, line: 50, type: !6)
!85 = !DILocation(line: 50, column: 7, scope: !69)
!86 = !DILocation(line: 50, column: 14, scope: !69)
!87 = !DILocation(line: 50, column: 20, scope: !69)
!88 = !DILocation(line: 51, column: 11, scope: !69)
!89 = !DILocation(line: 51, column: 9, scope: !69)
!90 = !DILocation(line: 54, column: 3, scope: !69)
