; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_614_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_614_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g1 = common global i32 0, align 4, !dbg !0
@g2 = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() #0 !dbg !16 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !19
  ret void, !dbg !20
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !21 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !24, metadata !DIExpression()), !dbg !25
  %3 = load i32, i32* %2, align 4, !dbg !26
  %4 = icmp ne i32 %3, 0, !dbg !28
  br i1 %4, label %7, label %5, !dbg !29

5:                                                ; preds = %1
  br label %6, !dbg !30

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !31), !dbg !33
  call void @reach_error(), !dbg !34
  call void @abort() #4, !dbg !36
  unreachable, !dbg !36

7:                                                ; preds = %1
  ret void, !dbg !37
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_614_001_isr_1(i8* %0) #0 !dbg !38 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %3, metadata !44, metadata !DIExpression()), !dbg !45
  %7 = load i32, i32* @g1, align 4, !dbg !46
  %8 = add nsw i32 %7, 1, !dbg !47
  store i32 %8, i32* %3, align 4, !dbg !45
  %9 = load i32, i32* %3, align 4, !dbg !48
  store i32 %9, i32* @g1, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata i32* %4, metadata !50, metadata !DIExpression()), !dbg !51
  %10 = load i32, i32* @g1, align 4, !dbg !52
  %11 = sub nsw i32 %10, 1, !dbg !53
  store i32 %11, i32* %4, align 4, !dbg !51
  %12 = load i32, i32* %4, align 4, !dbg !54
  store i32 %12, i32* @g1, align 4, !dbg !55
  call void @llvm.dbg.declare(metadata i32* %5, metadata !56, metadata !DIExpression()), !dbg !57
  %13 = load i32, i32* @g2, align 4, !dbg !58
  %14 = add nsw i32 %13, 1, !dbg !59
  store i32 %14, i32* %5, align 4, !dbg !57
  %15 = load i32, i32* %5, align 4, !dbg !60
  store i32 %15, i32* @g2, align 4, !dbg !61
  call void @llvm.dbg.declare(metadata i32* %6, metadata !62, metadata !DIExpression()), !dbg !63
  %16 = load i32, i32* @g2, align 4, !dbg !64
  %17 = sub nsw i32 %16, 1, !dbg !65
  store i32 %17, i32* %6, align 4, !dbg !63
  %18 = load i32, i32* %6, align 4, !dbg !66
  store i32 %18, i32* @g2, align 4, !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_614_001_main() #0 !dbg !69 {
  %1 = load i32, i32* @g1, align 4, !dbg !72
  %2 = icmp eq i32 %1, 0, !dbg !73
  %3 = zext i1 %2 to i32, !dbg !73
  call void @__VERIFIER_assert(i32 %3), !dbg !74
  %4 = load i32, i32* @g1, align 4, !dbg !75
  %5 = icmp eq i32 %4, 0, !dbg !76
  %6 = zext i1 %5 to i32, !dbg !76
  call void @__VERIFIER_assert(i32 %6), !dbg !77
  %7 = load i32, i32* @g2, align 4, !dbg !78
  %8 = icmp eq i32 %7, 0, !dbg !79
  %9 = zext i1 %8 to i32, !dbg !79
  call void @__VERIFIER_assert(i32 %9), !dbg !80
  %10 = load i32, i32* @g1, align 4, !dbg !81
  %11 = icmp eq i32 %10, 0, !dbg !82
  %12 = zext i1 %11 to i32, !dbg !82
  call void @__VERIFIER_assert(i32 %12), !dbg !83
  ret i32 0, !dbg !84
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g1", scope: !2, file: !8, line: 5, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_614_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "g2", scope: !2, file: !8, line: 5, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_614_001.c", directory: "/Users/hehang03/code/clover")
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
!38 = distinct !DISubprogram(name: "svp_simple_614_001_isr_1", scope: !8, file: !8, line: 7, type: !39, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DISubroutineType(types: !40)
!40 = !{null, !41}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!42 = !DILocalVariable(name: "arg", arg: 1, scope: !38, file: !8, line: 7, type: !41)
!43 = !DILocation(line: 7, column: 37, scope: !38)
!44 = !DILocalVariable(name: "tmp1", scope: !38, file: !8, line: 9, type: !9)
!45 = !DILocation(line: 9, column: 7, scope: !38)
!46 = !DILocation(line: 9, column: 14, scope: !38)
!47 = !DILocation(line: 9, column: 17, scope: !38)
!48 = !DILocation(line: 10, column: 8, scope: !38)
!49 = !DILocation(line: 10, column: 6, scope: !38)
!50 = !DILocalVariable(name: "tmp2", scope: !38, file: !8, line: 13, type: !9)
!51 = !DILocation(line: 13, column: 7, scope: !38)
!52 = !DILocation(line: 13, column: 14, scope: !38)
!53 = !DILocation(line: 13, column: 17, scope: !38)
!54 = !DILocation(line: 14, column: 8, scope: !38)
!55 = !DILocation(line: 14, column: 6, scope: !38)
!56 = !DILocalVariable(name: "tmp3", scope: !38, file: !8, line: 17, type: !9)
!57 = !DILocation(line: 17, column: 7, scope: !38)
!58 = !DILocation(line: 17, column: 14, scope: !38)
!59 = !DILocation(line: 17, column: 17, scope: !38)
!60 = !DILocation(line: 18, column: 8, scope: !38)
!61 = !DILocation(line: 18, column: 6, scope: !38)
!62 = !DILocalVariable(name: "tmp4", scope: !38, file: !8, line: 21, type: !9)
!63 = !DILocation(line: 21, column: 7, scope: !38)
!64 = !DILocation(line: 21, column: 14, scope: !38)
!65 = !DILocation(line: 21, column: 17, scope: !38)
!66 = !DILocation(line: 22, column: 8, scope: !38)
!67 = !DILocation(line: 22, column: 6, scope: !38)
!68 = !DILocation(line: 24, column: 1, scope: !38)
!69 = distinct !DISubprogram(name: "svp_simple_614_001_main", scope: !8, file: !8, line: 26, type: !70, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DISubroutineType(types: !71)
!71 = !{!9}
!72 = !DILocation(line: 29, column: 21, scope: !69)
!73 = !DILocation(line: 29, column: 24, scope: !69)
!74 = !DILocation(line: 29, column: 3, scope: !69)
!75 = !DILocation(line: 31, column: 21, scope: !69)
!76 = !DILocation(line: 31, column: 24, scope: !69)
!77 = !DILocation(line: 31, column: 3, scope: !69)
!78 = !DILocation(line: 33, column: 21, scope: !69)
!79 = !DILocation(line: 33, column: 24, scope: !69)
!80 = !DILocation(line: 33, column: 3, scope: !69)
!81 = !DILocation(line: 35, column: 21, scope: !69)
!82 = !DILocation(line: 35, column: 24, scope: !69)
!83 = !DILocation(line: 35, column: 3, scope: !69)
!84 = !DILocation(line: 37, column: 3, scope: !69)
