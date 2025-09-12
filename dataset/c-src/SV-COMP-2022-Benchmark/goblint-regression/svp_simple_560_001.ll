; ModuleID = 'svp_simple_560_001.c'
source_filename = "svp_simple_560_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@data = common global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @assume_abort_if_not(i32 %0) #0 !dbg !12 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !15, metadata !DIExpression()), !dbg !16
  %3 = load i32, i32* %2, align 4, !dbg !17
  %4 = icmp ne i32 %3, 0, !dbg !17
  br i1 %4, label %6, label %5, !dbg !19

5:                                                ; preds = %1
  call void @abort() #4, !dbg !20
  unreachable, !dbg !20

6:                                                ; preds = %1
  ret void, !dbg !22
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_560_001_isr_1(i8* %0) #0 !dbg !23 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %3, metadata !29, metadata !DIExpression()), !dbg !30
  %4 = load i32, i32* @data, align 4, !dbg !31
  %5 = add nsw i32 %4, 1, !dbg !32
  store i32 %5, i32* %3, align 4, !dbg !30
  %6 = load i32, i32* %3, align 4, !dbg !33
  store i32 %6, i32* @data, align 4, !dbg !34
  ret void, !dbg !35
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_560_001_main() #0 !dbg !36 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !39, metadata !DIExpression()), !dbg !40
  %3 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !41
  store i32 %3, i32* %1, align 4, !dbg !40
  %4 = load i32, i32* %1, align 4, !dbg !42
  %5 = icmp sle i32 0, %4, !dbg !43
  br i1 %5, label %6, label %9, !dbg !44

6:                                                ; preds = %0
  %7 = load i32, i32* %1, align 4, !dbg !45
  %8 = icmp slt i32 %7, 10, !dbg !46
  br label %9

9:                                                ; preds = %6, %0
  %10 = phi i1 [ false, %0 ], [ %8, %6 ], !dbg !47
  %11 = zext i1 %10 to i32, !dbg !44
  call void @assume_abort_if_not(i32 %11), !dbg !48
  call void @llvm.dbg.declare(metadata i32* %2, metadata !49, metadata !DIExpression()), !dbg !50
  %12 = load i32, i32* @data, align 4, !dbg !51
  %13 = add nsw i32 %12, 1, !dbg !52
  store i32 %13, i32* %2, align 4, !dbg !50
  %14 = load i32, i32* %2, align 4, !dbg !53
  store i32 %14, i32* @data, align 4, !dbg !54
  ret i32 0, !dbg !55
}

declare i32 @__VERIFIER_nondet_int(...) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "data", scope: !2, file: !3, line: 8, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_560_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{!"clang version 10.0.0 "}
!12 = distinct !DISubprogram(name: "assume_abort_if_not", scope: !3, file: !3, line: 3, type: !13, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!13 = !DISubroutineType(types: !14)
!14 = !{null, !6}
!15 = !DILocalVariable(name: "cond", arg: 1, scope: !12, file: !3, line: 3, type: !6)
!16 = !DILocation(line: 3, column: 30, scope: !12)
!17 = !DILocation(line: 4, column: 7, scope: !18)
!18 = distinct !DILexicalBlock(scope: !12, file: !3, line: 4, column: 6)
!19 = !DILocation(line: 4, column: 6, scope: !12)
!20 = !DILocation(line: 4, column: 14, scope: !21)
!21 = distinct !DILexicalBlock(scope: !18, file: !3, line: 4, column: 13)
!22 = !DILocation(line: 5, column: 1, scope: !12)
!23 = distinct !DISubprogram(name: "svp_simple_560_001_isr_1", scope: !3, file: !3, line: 11, type: !24, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !26}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!27 = !DILocalVariable(name: "arg", arg: 1, scope: !23, file: !3, line: 11, type: !26)
!28 = !DILocation(line: 11, column: 37, scope: !23)
!29 = !DILocalVariable(name: "tmp", scope: !23, file: !3, line: 13, type: !6)
!30 = !DILocation(line: 13, column: 5, scope: !23)
!31 = !DILocation(line: 13, column: 9, scope: !23)
!32 = !DILocation(line: 13, column: 13, scope: !23)
!33 = !DILocation(line: 14, column: 9, scope: !23)
!34 = !DILocation(line: 14, column: 7, scope: !23)
!35 = !DILocation(line: 17, column: 1, scope: !23)
!36 = distinct !DISubprogram(name: "svp_simple_560_001_main", scope: !3, file: !3, line: 19, type: !37, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DISubroutineType(types: !38)
!38 = !{!6}
!39 = !DILocalVariable(name: "i", scope: !36, file: !3, line: 21, type: !6)
!40 = !DILocation(line: 21, column: 7, scope: !36)
!41 = !DILocation(line: 21, column: 11, scope: !36)
!42 = !DILocation(line: 22, column: 28, scope: !36)
!43 = !DILocation(line: 22, column: 25, scope: !36)
!44 = !DILocation(line: 22, column: 30, scope: !36)
!45 = !DILocation(line: 22, column: 33, scope: !36)
!46 = !DILocation(line: 22, column: 35, scope: !36)
!47 = !DILocation(line: 0, scope: !36)
!48 = !DILocation(line: 22, column: 3, scope: !36)
!49 = !DILocalVariable(name: "tmp", scope: !36, file: !3, line: 23, type: !6)
!50 = !DILocation(line: 23, column: 7, scope: !36)
!51 = !DILocation(line: 23, column: 11, scope: !36)
!52 = !DILocation(line: 23, column: 15, scope: !36)
!53 = !DILocation(line: 24, column: 9, scope: !36)
!54 = !DILocation(line: 24, column: 7, scope: !36)
!55 = !DILocation(line: 27, column: 3, scope: !36)
