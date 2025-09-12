; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/claude-4-sonnet/svp_simple_640_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_640_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g = common local_unnamed_addr global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [8 x i8] c"g is %i\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() local_unnamed_addr #0 !dbg !13 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !16
  ret void, !dbg !17
}

declare i32 @assert(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__VERIFIER_assert(i32 %0) local_unnamed_addr #0 !dbg !18 {
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
  call void @abort() #5, !dbg !33
  unreachable, !dbg !33

7:                                                ; preds = %1
  ret void, !dbg !34
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_640_001_isr_1(i8* %0) local_unnamed_addr #0 !dbg !35 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 1, i32* @g, align 4, !dbg !41
  %3 = load i32, i32* @g, align 4, !dbg !42
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i32 %3), !dbg !43
  store i32 0, i32* @g, align 4, !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_640_001_isr_2(i8* %0) local_unnamed_addr #0 !dbg !46 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !47, metadata !DIExpression()), !dbg !48
  %3 = load i32, i32* @g, align 4, !dbg !49
  %4 = icmp eq i32 %3, 0, !dbg !50
  %5 = xor i1 %4, true, !dbg !51
  %6 = zext i1 %5 to i32, !dbg !51
  call void @__VERIFIER_assert(i32 %6), !dbg !52
  store i32 0, i32* @g, align 4, !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_640_001_main(i32 %0, i8** %1) local_unnamed_addr #0 !dbg !55 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %1, i8*** %4, align 8
  call void @llvm.dbg.declare(metadata i8*** %4, metadata !64, metadata !DIExpression()), !dbg !65
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 1), !dbg !66
  ret i32 0, !dbg !67
}

declare i32 @sleep(...) local_unnamed_addr #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !6, line: 5, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_640_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_640_001.c", directory: "/Users/hehang03/code/clover")
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
!18 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !6, file: !6, line: 3, type: !19, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !7}
!21 = !DILocalVariable(name: "cond", arg: 1, scope: !18, file: !6, line: 3, type: !7)
!22 = !DILocation(line: 3, column: 28, scope: !18)
!23 = !DILocation(line: 3, column: 41, scope: !24)
!24 = distinct !DILexicalBlock(scope: !18, file: !6, line: 3, column: 39)
!25 = !DILocation(line: 3, column: 40, scope: !24)
!26 = !DILocation(line: 3, column: 39, scope: !18)
!27 = !DILocation(line: 3, column: 48, scope: !24)
!28 = !DILabel(scope: !29, name: "ERROR", file: !6, line: 3)
!29 = distinct !DILexicalBlock(scope: !24, file: !6, line: 3, column: 48)
!30 = !DILocation(line: 3, column: 50, scope: !29)
!31 = !DILocation(line: 3, column: 58, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !6, line: 3, column: 57)
!33 = !DILocation(line: 3, column: 72, scope: !32)
!34 = !DILocation(line: 3, column: 84, scope: !18)
!35 = distinct !DISubprogram(name: "svp_simple_640_001_isr_1", scope: !6, file: !6, line: 7, type: !36, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DISubroutineType(types: !37)
!37 = !{null, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!39 = !DILocalVariable(name: "ptr", arg: 1, scope: !35, file: !6, line: 7, type: !38)
!40 = !DILocation(line: 7, column: 37, scope: !35)
!41 = !DILocation(line: 8, column: 7, scope: !35)
!42 = !DILocation(line: 9, column: 23, scope: !35)
!43 = !DILocation(line: 9, column: 5, scope: !35)
!44 = !DILocation(line: 10, column: 7, scope: !35)
!45 = !DILocation(line: 11, column: 1, scope: !35)
!46 = distinct !DISubprogram(name: "svp_simple_640_001_isr_2", scope: !6, file: !6, line: 13, type: !36, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!47 = !DILocalVariable(name: "ptr", arg: 1, scope: !46, file: !6, line: 13, type: !38)
!48 = !DILocation(line: 13, column: 37, scope: !46)
!49 = !DILocation(line: 14, column: 25, scope: !46)
!50 = !DILocation(line: 14, column: 27, scope: !46)
!51 = !DILocation(line: 14, column: 23, scope: !46)
!52 = !DILocation(line: 14, column: 5, scope: !46)
!53 = !DILocation(line: 15, column: 7, scope: !46)
!54 = !DILocation(line: 16, column: 1, scope: !46)
!55 = distinct !DISubprogram(name: "svp_simple_640_001_main", scope: !6, file: !6, line: 18, type: !56, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DISubroutineType(types: !57)
!57 = !{!7, !7, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !61)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !6, line: 18, type: !7)
!63 = !DILocation(line: 18, column: 33, scope: !55)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !6, line: 18, type: !58)
!65 = !DILocation(line: 18, column: 51, scope: !55)
!66 = !DILocation(line: 21, column: 5, scope: !55)
!67 = !DILocation(line: 23, column: 5, scope: !55)
