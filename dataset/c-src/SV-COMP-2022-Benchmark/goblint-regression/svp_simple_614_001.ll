; ModuleID = 'svp_simple_614_001.c'
source_filename = "svp_simple_614_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g1 = common global i32 0, align 4, !dbg !0
@g2 = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() #0 !dbg !14 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !17
  ret void, !dbg !18
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !19 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !22, metadata !DIExpression()), !dbg !23
  %3 = load i32, i32* %2, align 4, !dbg !24
  %4 = icmp ne i32 %3, 0, !dbg !26
  br i1 %4, label %7, label %5, !dbg !27

5:                                                ; preds = %1
  br label %6, !dbg !28

6:                                                ; preds = %5
  call void @llvm.dbg.label(metadata !29), !dbg !31
  call void @reach_error(), !dbg !32
  call void @abort() #4, !dbg !34
  unreachable, !dbg !34

7:                                                ; preds = %1
  ret void, !dbg !35
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_614_001_isr_1(i8* %0) #0 !dbg !36 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i32* %3, metadata !42, metadata !DIExpression()), !dbg !43
  %7 = load i32, i32* @g1, align 4, !dbg !44
  %8 = add nsw i32 %7, 1, !dbg !45
  store i32 %8, i32* %3, align 4, !dbg !43
  %9 = load i32, i32* %3, align 4, !dbg !46
  store i32 %9, i32* @g1, align 4, !dbg !47
  call void @llvm.dbg.declare(metadata i32* %4, metadata !48, metadata !DIExpression()), !dbg !49
  %10 = load i32, i32* @g1, align 4, !dbg !50
  %11 = sub nsw i32 %10, 1, !dbg !51
  store i32 %11, i32* %4, align 4, !dbg !49
  %12 = load i32, i32* %4, align 4, !dbg !52
  store i32 %12, i32* @g1, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata i32* %5, metadata !54, metadata !DIExpression()), !dbg !55
  %13 = load i32, i32* @g2, align 4, !dbg !56
  %14 = add nsw i32 %13, 1, !dbg !57
  store i32 %14, i32* %5, align 4, !dbg !55
  %15 = load i32, i32* %5, align 4, !dbg !58
  store i32 %15, i32* @g2, align 4, !dbg !59
  call void @llvm.dbg.declare(metadata i32* %6, metadata !60, metadata !DIExpression()), !dbg !61
  %16 = load i32, i32* @g2, align 4, !dbg !62
  %17 = sub nsw i32 %16, 1, !dbg !63
  store i32 %17, i32* %6, align 4, !dbg !61
  %18 = load i32, i32* %6, align 4, !dbg !64
  store i32 %18, i32* @g2, align 4, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_614_001_main() #0 !dbg !67 {
  %1 = load i32, i32* @g1, align 4, !dbg !70
  %2 = icmp eq i32 %1, 0, !dbg !71
  %3 = zext i1 %2 to i32, !dbg !71
  call void @__VERIFIER_assert(i32 %3), !dbg !72
  %4 = load i32, i32* @g1, align 4, !dbg !73
  %5 = icmp eq i32 %4, 0, !dbg !74
  %6 = zext i1 %5 to i32, !dbg !74
  call void @__VERIFIER_assert(i32 %6), !dbg !75
  %7 = load i32, i32* @g2, align 4, !dbg !76
  %8 = icmp eq i32 %7, 0, !dbg !77
  %9 = zext i1 %8 to i32, !dbg !77
  call void @__VERIFIER_assert(i32 %9), !dbg !78
  %10 = load i32, i32* @g1, align 4, !dbg !79
  %11 = icmp eq i32 %10, 0, !dbg !80
  %12 = zext i1 %11 to i32, !dbg !80
  call void @__VERIFIER_assert(i32 %12), !dbg !81
  ret i32 0, !dbg !82
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g1", scope: !2, file: !3, line: 5, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_614_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "g2", scope: !2, file: !3, line: 5, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "reach_error", scope: !3, file: !3, line: 2, type: !15, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocation(line: 2, column: 22, scope: !14)
!18 = !DILocation(line: 2, column: 33, scope: !14)
!19 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !3, file: !3, line: 3, type: !20, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !8}
!22 = !DILocalVariable(name: "cond", arg: 1, scope: !19, file: !3, line: 3, type: !8)
!23 = !DILocation(line: 3, column: 28, scope: !19)
!24 = !DILocation(line: 3, column: 41, scope: !25)
!25 = distinct !DILexicalBlock(scope: !19, file: !3, line: 3, column: 39)
!26 = !DILocation(line: 3, column: 40, scope: !25)
!27 = !DILocation(line: 3, column: 39, scope: !19)
!28 = !DILocation(line: 3, column: 48, scope: !25)
!29 = !DILabel(scope: !30, name: "ERROR", file: !3, line: 3)
!30 = distinct !DILexicalBlock(scope: !25, file: !3, line: 3, column: 48)
!31 = !DILocation(line: 3, column: 50, scope: !30)
!32 = !DILocation(line: 3, column: 58, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !3, line: 3, column: 57)
!34 = !DILocation(line: 3, column: 72, scope: !33)
!35 = !DILocation(line: 3, column: 84, scope: !19)
!36 = distinct !DISubprogram(name: "svp_simple_614_001_isr_1", scope: !3, file: !3, line: 7, type: !37, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!40 = !DILocalVariable(name: "arg", arg: 1, scope: !36, file: !3, line: 7, type: !39)
!41 = !DILocation(line: 7, column: 37, scope: !36)
!42 = !DILocalVariable(name: "tmp1", scope: !36, file: !3, line: 9, type: !8)
!43 = !DILocation(line: 9, column: 7, scope: !36)
!44 = !DILocation(line: 9, column: 14, scope: !36)
!45 = !DILocation(line: 9, column: 17, scope: !36)
!46 = !DILocation(line: 10, column: 8, scope: !36)
!47 = !DILocation(line: 10, column: 6, scope: !36)
!48 = !DILocalVariable(name: "tmp2", scope: !36, file: !3, line: 13, type: !8)
!49 = !DILocation(line: 13, column: 7, scope: !36)
!50 = !DILocation(line: 13, column: 14, scope: !36)
!51 = !DILocation(line: 13, column: 17, scope: !36)
!52 = !DILocation(line: 14, column: 8, scope: !36)
!53 = !DILocation(line: 14, column: 6, scope: !36)
!54 = !DILocalVariable(name: "tmp3", scope: !36, file: !3, line: 17, type: !8)
!55 = !DILocation(line: 17, column: 7, scope: !36)
!56 = !DILocation(line: 17, column: 14, scope: !36)
!57 = !DILocation(line: 17, column: 17, scope: !36)
!58 = !DILocation(line: 18, column: 8, scope: !36)
!59 = !DILocation(line: 18, column: 6, scope: !36)
!60 = !DILocalVariable(name: "tmp4", scope: !36, file: !3, line: 21, type: !8)
!61 = !DILocation(line: 21, column: 7, scope: !36)
!62 = !DILocation(line: 21, column: 14, scope: !36)
!63 = !DILocation(line: 21, column: 17, scope: !36)
!64 = !DILocation(line: 22, column: 8, scope: !36)
!65 = !DILocation(line: 22, column: 6, scope: !36)
!66 = !DILocation(line: 24, column: 1, scope: !36)
!67 = distinct !DISubprogram(name: "svp_simple_614_001_main", scope: !3, file: !3, line: 26, type: !68, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DISubroutineType(types: !69)
!69 = !{!8}
!70 = !DILocation(line: 29, column: 21, scope: !67)
!71 = !DILocation(line: 29, column: 24, scope: !67)
!72 = !DILocation(line: 29, column: 3, scope: !67)
!73 = !DILocation(line: 31, column: 21, scope: !67)
!74 = !DILocation(line: 31, column: 24, scope: !67)
!75 = !DILocation(line: 31, column: 3, scope: !67)
!76 = !DILocation(line: 33, column: 21, scope: !67)
!77 = !DILocation(line: 33, column: 24, scope: !67)
!78 = !DILocation(line: 33, column: 3, scope: !67)
!79 = !DILocation(line: 35, column: 21, scope: !67)
!80 = !DILocation(line: 35, column: 24, scope: !67)
!81 = !DILocation(line: 35, column: 3, scope: !67)
!82 = !DILocation(line: 37, column: 3, scope: !67)
