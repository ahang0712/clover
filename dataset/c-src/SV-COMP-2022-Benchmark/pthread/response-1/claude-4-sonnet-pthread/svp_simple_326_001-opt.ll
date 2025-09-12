; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/pthread/response-1/claude-4-sonnet/svp_simple_326_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_326_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@num = common local_unnamed_addr global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() local_unnamed_addr #0 !dbg !13 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !16
  ret void, !dbg !17
}

declare i32 @assert(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_326_001_isr_1(i8* %0) local_unnamed_addr #0 !dbg !18 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !22, metadata !DIExpression()), !dbg !23
  br label %4, !dbg !24

4:                                                ; preds = %7, %1
  %5 = load i32, i32* @num, align 4, !dbg !25
  %6 = icmp sgt i32 %5, 0, !dbg !26
  br i1 %6, label %7, label %11, !dbg !24

7:                                                ; preds = %4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !27, metadata !DIExpression()), !dbg !29
  %8 = load i32, i32* @num, align 4, !dbg !30
  %9 = sub nsw i32 %8, 1, !dbg !31
  store i32 %9, i32* %3, align 4, !dbg !29
  %10 = load i32, i32* %3, align 4, !dbg !32
  store i32 %10, i32* @num, align 4, !dbg !33
  br label %4, !dbg !24, !llvm.loop !34

11:                                               ; preds = %4
  ret void, !dbg !36
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_326_001_isr_2(i8* %0) local_unnamed_addr #0 !dbg !37 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !38, metadata !DIExpression()), !dbg !39
  br label %4, !dbg !40

4:                                                ; preds = %7, %1
  %5 = load i32, i32* @num, align 4, !dbg !41
  %6 = icmp eq i32 %5, 0, !dbg !42
  br i1 %6, label %7, label %11, !dbg !40

7:                                                ; preds = %4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !43, metadata !DIExpression()), !dbg !45
  %8 = load i32, i32* @num, align 4, !dbg !46
  %9 = sub nsw i32 %8, 1, !dbg !47
  store i32 %9, i32* %3, align 4, !dbg !45
  %10 = load i32, i32* %3, align 4, !dbg !48
  store i32 %10, i32* @num, align 4, !dbg !49
  br label %4, !dbg !40, !llvm.loop !50

11:                                               ; preds = %4
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_326_001_main() local_unnamed_addr #0 !dbg !53 {
  store i32 1, i32* @num, align 4, !dbg !56
  %1 = load i32, i32* @num, align 4, !dbg !57
  %2 = icmp ne i32 %1, 1, !dbg !59
  br i1 %2, label %3, label %5, !dbg !60

3:                                                ; preds = %0
  br label %4, !dbg !61

4:                                                ; preds = %3
  call void @llvm.dbg.label(metadata !62), !dbg !64
  call void @reach_error(), !dbg !65
  call void @abort() #4, !dbg !67
  unreachable, !dbg !67

5:                                                ; preds = %0
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #3

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "num", scope: !2, file: !6, line: 4, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_326_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_326_001.c", directory: "/Users/hehang03/code/clover")
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
!18 = distinct !DISubprogram(name: "svp_simple_326_001_isr_1", scope: !6, file: !6, line: 7, type: !19, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!22 = !DILocalVariable(name: "arg", arg: 1, scope: !18, file: !6, line: 7, type: !21)
!23 = !DILocation(line: 7, column: 38, scope: !18)
!24 = !DILocation(line: 10, column: 3, scope: !18)
!25 = !DILocation(line: 10, column: 10, scope: !18)
!26 = !DILocation(line: 10, column: 14, scope: !18)
!27 = !DILocalVariable(name: "tmp", scope: !28, file: !6, line: 11, type: !7)
!28 = distinct !DILexicalBlock(scope: !18, file: !6, line: 10, column: 19)
!29 = !DILocation(line: 11, column: 9, scope: !28)
!30 = !DILocation(line: 11, column: 15, scope: !28)
!31 = !DILocation(line: 11, column: 18, scope: !28)
!32 = !DILocation(line: 12, column: 9, scope: !28)
!33 = !DILocation(line: 12, column: 8, scope: !28)
!34 = distinct !{!34, !24, !35}
!35 = !DILocation(line: 13, column: 3, scope: !18)
!36 = !DILocation(line: 14, column: 1, scope: !18)
!37 = distinct !DISubprogram(name: "svp_simple_326_001_isr_2", scope: !6, file: !6, line: 17, type: !19, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!38 = !DILocalVariable(name: "arg", arg: 1, scope: !37, file: !6, line: 17, type: !21)
!39 = !DILocation(line: 17, column: 38, scope: !37)
!40 = !DILocation(line: 20, column: 3, scope: !37)
!41 = !DILocation(line: 20, column: 10, scope: !37)
!42 = !DILocation(line: 20, column: 14, scope: !37)
!43 = !DILocalVariable(name: "tmp", scope: !44, file: !6, line: 21, type: !7)
!44 = distinct !DILexicalBlock(scope: !37, file: !6, line: 20, column: 20)
!45 = !DILocation(line: 21, column: 9, scope: !44)
!46 = !DILocation(line: 21, column: 15, scope: !44)
!47 = !DILocation(line: 21, column: 18, scope: !44)
!48 = !DILocation(line: 22, column: 9, scope: !44)
!49 = !DILocation(line: 22, column: 8, scope: !44)
!50 = distinct !{!50, !40, !51}
!51 = !DILocation(line: 23, column: 3, scope: !37)
!52 = !DILocation(line: 25, column: 1, scope: !37)
!53 = distinct !DISubprogram(name: "svp_simple_326_001_main", scope: !6, file: !6, line: 28, type: !54, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!7}
!56 = !DILocation(line: 31, column: 7, scope: !53)
!57 = !DILocation(line: 33, column: 7, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !6, line: 33, column: 7)
!59 = !DILocation(line: 33, column: 10, scope: !58)
!60 = !DILocation(line: 33, column: 7, scope: !53)
!61 = !DILocation(line: 34, column: 3, scope: !58)
!62 = !DILabel(scope: !63, name: "ERROR", file: !6, line: 35)
!63 = distinct !DILexicalBlock(scope: !58, file: !6, line: 34, column: 3)
!64 = !DILocation(line: 35, column: 5, scope: !63)
!65 = !DILocation(line: 35, column: 13, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !6, line: 35, column: 12)
!67 = !DILocation(line: 35, column: 27, scope: !66)
!68 = !DILocation(line: 38, column: 3, scope: !53)
