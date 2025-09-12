; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_635_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_635_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g = global i32 0, align 4, !dbg !0

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
define void @svp_simple_635_001_isr1(i8* %0) #0 !dbg !35 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 1000, i32* @g, align 4, !dbg !41
  %3 = load i32, i32* @g, align 4, !dbg !42
  %4 = icmp ne i32 %3, 0, !dbg !43
  %5 = zext i1 %4 to i32, !dbg !43
  call void @__VERIFIER_assert(i32 %5), !dbg !44
  %6 = load i32, i32* @g, align 4, !dbg !45
  %7 = icmp sgt i32 %6, 0, !dbg !47
  br i1 %7, label %8, label %11, !dbg !48

8:                                                ; preds = %1
  %9 = load i32, i32* @g, align 4, !dbg !49
  %10 = add nsw i32 %9, -1, !dbg !49
  store i32 %10, i32* @g, align 4, !dbg !49
  br label %11, !dbg !51

11:                                               ; preds = %8, %1
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_635_001_main(i32 %0, i8** %1) #0 !dbg !53 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %1, i8*** %4, align 8
  call void @llvm.dbg.declare(metadata i8*** %4, metadata !61, metadata !DIExpression()), !dbg !62
  ret i32 0, !dbg !63
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
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !6, line: 8, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_635_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_635_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{!"clang version 10.0.0 "}
!13 = distinct !DISubprogram(name: "reach_error", scope: !6, file: !6, line: 3, type: !14, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocation(line: 3, column: 22, scope: !13)
!17 = !DILocation(line: 3, column: 33, scope: !13)
!18 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !6, file: !6, line: 4, type: !19, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !7}
!21 = !DILocalVariable(name: "cond", arg: 1, scope: !18, file: !6, line: 4, type: !7)
!22 = !DILocation(line: 4, column: 28, scope: !18)
!23 = !DILocation(line: 4, column: 41, scope: !24)
!24 = distinct !DILexicalBlock(scope: !18, file: !6, line: 4, column: 39)
!25 = !DILocation(line: 4, column: 40, scope: !24)
!26 = !DILocation(line: 4, column: 39, scope: !18)
!27 = !DILocation(line: 4, column: 48, scope: !24)
!28 = !DILabel(scope: !29, name: "ERROR", file: !6, line: 4)
!29 = distinct !DILexicalBlock(scope: !24, file: !6, line: 4, column: 48)
!30 = !DILocation(line: 4, column: 50, scope: !29)
!31 = !DILocation(line: 4, column: 58, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !6, line: 4, column: 57)
!33 = !DILocation(line: 4, column: 72, scope: !32)
!34 = !DILocation(line: 4, column: 84, scope: !18)
!35 = distinct !DISubprogram(name: "svp_simple_635_001_isr1", scope: !6, file: !6, line: 12, type: !36, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DISubroutineType(types: !37)
!37 = !{null, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!39 = !DILocalVariable(name: "arg", arg: 1, scope: !35, file: !6, line: 12, type: !38)
!40 = !DILocation(line: 12, column: 36, scope: !35)
!41 = !DILocation(line: 15, column: 7, scope: !35)
!42 = !DILocation(line: 16, column: 23, scope: !35)
!43 = !DILocation(line: 16, column: 25, scope: !35)
!44 = !DILocation(line: 16, column: 5, scope: !35)
!45 = !DILocation(line: 17, column: 9, scope: !46)
!46 = distinct !DILexicalBlock(scope: !35, file: !6, line: 17, column: 9)
!47 = !DILocation(line: 17, column: 11, scope: !46)
!48 = !DILocation(line: 17, column: 9, scope: !35)
!49 = !DILocation(line: 18, column: 8, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !6, line: 17, column: 16)
!51 = !DILocation(line: 19, column: 5, scope: !50)
!52 = !DILocation(line: 22, column: 1, scope: !35)
!53 = distinct !DISubprogram(name: "svp_simple_635_001_main", scope: !6, file: !6, line: 24, type: !54, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!7, !7, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !6, line: 24, type: !7)
!60 = !DILocation(line: 24, column: 33, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !6, line: 24, type: !56)
!62 = !DILocation(line: 24, column: 47, scope: !53)
!63 = !DILocation(line: 27, column: 3, scope: !53)
