; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_560_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_560_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@data = common global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @assume_abort_if_not(i32 %0) #0 !dbg !13 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !16, metadata !DIExpression()), !dbg !17
  %3 = load i32, i32* %2, align 4, !dbg !18
  %4 = icmp ne i32 %3, 0, !dbg !18
  br i1 %4, label %6, label %5, !dbg !20

5:                                                ; preds = %1
  call void @abort() #4, !dbg !21
  unreachable, !dbg !21

6:                                                ; preds = %1
  ret void, !dbg !23
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_560_001_isr_1(i8* %0) #0 !dbg !24 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %3, metadata !30, metadata !DIExpression()), !dbg !31
  %4 = load i32, i32* @data, align 4, !dbg !32
  %5 = add nsw i32 %4, 1, !dbg !33
  store i32 %5, i32* %3, align 4, !dbg !31
  %6 = load i32, i32* %3, align 4, !dbg !34
  store i32 %6, i32* @data, align 4, !dbg !35
  ret void, !dbg !36
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_560_001_main() #0 !dbg !37 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !40, metadata !DIExpression()), !dbg !41
  %3 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !42
  store i32 %3, i32* %1, align 4, !dbg !41
  %4 = load i32, i32* %1, align 4, !dbg !43
  %5 = icmp sle i32 0, %4, !dbg !44
  br i1 %5, label %6, label %9, !dbg !45

6:                                                ; preds = %0
  %7 = load i32, i32* %1, align 4, !dbg !46
  %8 = icmp slt i32 %7, 10, !dbg !47
  br label %9

9:                                                ; preds = %6, %0
  %10 = phi i1 [ false, %0 ], [ %8, %6 ], !dbg !48
  %11 = zext i1 %10 to i32, !dbg !45
  call void @assume_abort_if_not(i32 %11), !dbg !49
  call void @llvm.dbg.declare(metadata i32* %2, metadata !50, metadata !DIExpression()), !dbg !51
  %12 = load i32, i32* @data, align 4, !dbg !52
  %13 = add nsw i32 %12, 1, !dbg !53
  store i32 %13, i32* %2, align 4, !dbg !51
  %14 = load i32, i32* %2, align 4, !dbg !54
  store i32 %14, i32* @data, align 4, !dbg !55
  ret i32 0, !dbg !56
}

declare i32 @__VERIFIER_nondet_int(...) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "data", scope: !2, file: !6, line: 8, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_560_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_560_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{!"clang version 10.0.0 "}
!13 = distinct !DISubprogram(name: "assume_abort_if_not", scope: !6, file: !6, line: 3, type: !14, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{null, !7}
!16 = !DILocalVariable(name: "cond", arg: 1, scope: !13, file: !6, line: 3, type: !7)
!17 = !DILocation(line: 3, column: 30, scope: !13)
!18 = !DILocation(line: 4, column: 7, scope: !19)
!19 = distinct !DILexicalBlock(scope: !13, file: !6, line: 4, column: 6)
!20 = !DILocation(line: 4, column: 6, scope: !13)
!21 = !DILocation(line: 4, column: 14, scope: !22)
!22 = distinct !DILexicalBlock(scope: !19, file: !6, line: 4, column: 13)
!23 = !DILocation(line: 5, column: 1, scope: !13)
!24 = distinct !DISubprogram(name: "svp_simple_560_001_isr_1", scope: !6, file: !6, line: 11, type: !25, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !27}
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!28 = !DILocalVariable(name: "arg", arg: 1, scope: !24, file: !6, line: 11, type: !27)
!29 = !DILocation(line: 11, column: 37, scope: !24)
!30 = !DILocalVariable(name: "tmp", scope: !24, file: !6, line: 13, type: !7)
!31 = !DILocation(line: 13, column: 5, scope: !24)
!32 = !DILocation(line: 13, column: 9, scope: !24)
!33 = !DILocation(line: 13, column: 13, scope: !24)
!34 = !DILocation(line: 14, column: 9, scope: !24)
!35 = !DILocation(line: 14, column: 7, scope: !24)
!36 = !DILocation(line: 17, column: 1, scope: !24)
!37 = distinct !DISubprogram(name: "svp_simple_560_001_main", scope: !6, file: !6, line: 19, type: !38, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!38 = !DISubroutineType(types: !39)
!39 = !{!7}
!40 = !DILocalVariable(name: "i", scope: !37, file: !6, line: 21, type: !7)
!41 = !DILocation(line: 21, column: 7, scope: !37)
!42 = !DILocation(line: 21, column: 11, scope: !37)
!43 = !DILocation(line: 22, column: 28, scope: !37)
!44 = !DILocation(line: 22, column: 25, scope: !37)
!45 = !DILocation(line: 22, column: 30, scope: !37)
!46 = !DILocation(line: 22, column: 33, scope: !37)
!47 = !DILocation(line: 22, column: 35, scope: !37)
!48 = !DILocation(line: 0, scope: !37)
!49 = !DILocation(line: 22, column: 3, scope: !37)
!50 = !DILocalVariable(name: "tmp", scope: !37, file: !6, line: 23, type: !7)
!51 = !DILocation(line: 23, column: 7, scope: !37)
!52 = !DILocation(line: 23, column: 11, scope: !37)
!53 = !DILocation(line: 23, column: 15, scope: !37)
!54 = !DILocation(line: 24, column: 9, scope: !37)
!55 = !DILocation(line: 24, column: 7, scope: !37)
!56 = !DILocation(line: 27, column: 3, scope: !37)
