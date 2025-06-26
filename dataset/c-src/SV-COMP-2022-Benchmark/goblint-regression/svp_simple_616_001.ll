; ModuleID = 'svp_simple_616_001.bc'
source_filename = "./svp_simple_616_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g1 = common global i32 0, align 4
@g2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !12 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !13
  %3 = load i32, i32* %2, align 4, !dbg !17, !tbaa !13
  %4 = icmp ne i32 %3, 0, !dbg !18
  br i1 %4, label %7, label %5, !dbg !19

5:                                                ; preds = %1
  br label %6, !dbg !20

6:                                                ; preds = %5
  call void @reach_error(), !dbg !21
  call void @abort() #4, !dbg !22
  unreachable, !dbg !22

7:                                                ; preds = %1
  ret void, !dbg !23
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: nounwind uwtable
define void @svp_simple_616_001_isr_1(i8* %0) #0 !dbg !24 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !25
  %5 = bitcast i32* %3 to i8*, !dbg !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #5, !dbg !27
  %6 = load i32, i32* @g1, align 4, !dbg !28, !tbaa !13
  %7 = add nsw i32 %6, 1, !dbg !29
  store i32 %7, i32* %3, align 4, !dbg !30, !tbaa !13
  %8 = load i32, i32* %3, align 4, !dbg !31, !tbaa !13
  store i32 %8, i32* @g1, align 4, !dbg !32, !tbaa !13
  %9 = bitcast i32* %4 to i8*, !dbg !33
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #5, !dbg !33
  %10 = load i32, i32* @g1, align 4, !dbg !34, !tbaa !13
  %11 = sub nsw i32 %10, 1, !dbg !35
  store i32 %11, i32* %4, align 4, !dbg !36, !tbaa !13
  %12 = load i32, i32* %4, align 4, !dbg !37, !tbaa !13
  store i32 %12, i32* @g1, align 4, !dbg !38, !tbaa !13
  %13 = bitcast i32* %4 to i8*, !dbg !39
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #5, !dbg !39
  %14 = bitcast i32* %3 to i8*, !dbg !39
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #5, !dbg !39
  ret void, !dbg !39
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define void @svp_simple_616_001_isr_2(i8* %0) #0 !dbg !40 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !25
  %5 = bitcast i32* %3 to i8*, !dbg !41
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #5, !dbg !41
  %6 = load i32, i32* @g2, align 4, !dbg !42, !tbaa !13
  %7 = add nsw i32 %6, 1, !dbg !43
  store i32 %7, i32* %3, align 4, !dbg !44, !tbaa !13
  %8 = load i32, i32* %3, align 4, !dbg !45, !tbaa !13
  store i32 %8, i32* @g2, align 4, !dbg !46, !tbaa !13
  %9 = bitcast i32* %4 to i8*, !dbg !47
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #5, !dbg !47
  %10 = load i32, i32* @g2, align 4, !dbg !48, !tbaa !13
  %11 = sub nsw i32 %10, 1, !dbg !49
  store i32 %11, i32* %4, align 4, !dbg !50, !tbaa !13
  %12 = load i32, i32* %4, align 4, !dbg !51, !tbaa !13
  store i32 %12, i32* @g2, align 4, !dbg !52, !tbaa !13
  %13 = bitcast i32* %4 to i8*, !dbg !53
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #5, !dbg !53
  %14 = bitcast i32* %3 to i8*, !dbg !53
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #5, !dbg !53
  ret void, !dbg !53
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_616_001_main() #0 !dbg !54 {
  %1 = load i32, i32* @g1, align 4, !dbg !55, !tbaa !13
  %2 = icmp eq i32 %1, 0, !dbg !56
  %3 = zext i1 %2 to i32, !dbg !56
  call void @__VERIFIER_assert(i32 %3), !dbg !57
  %4 = load i32, i32* @g1, align 4, !dbg !58, !tbaa !13
  %5 = icmp eq i32 %4, 0, !dbg !59
  %6 = zext i1 %5 to i32, !dbg !59
  call void @__VERIFIER_assert(i32 %6), !dbg !60
  %7 = load i32, i32* @g2, align 4, !dbg !61, !tbaa !13
  %8 = icmp eq i32 %7, 0, !dbg !62
  %9 = zext i1 %8 to i32, !dbg !62
  call void @__VERIFIER_assert(i32 %9), !dbg !63
  %10 = load i32, i32* @g1, align 4, !dbg !64, !tbaa !13
  %11 = icmp eq i32 %10, 0, !dbg !65
  %12 = zext i1 %11 to i32, !dbg !65
  call void @__VERIFIER_assert(i32 %12), !dbg !66
  ret i32 0, !dbg !67
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { noreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_616_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_616_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 2, column: 22, scope: !7)
!11 = !DILocation(line: 2, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 3, column: 41, scope: !12)
!18 = !DILocation(line: 3, column: 40, scope: !12)
!19 = !DILocation(line: 3, column: 39, scope: !12)
!20 = !DILocation(line: 3, column: 48, scope: !12)
!21 = !DILocation(line: 3, column: 58, scope: !12)
!22 = !DILocation(line: 3, column: 72, scope: !12)
!23 = !DILocation(line: 3, column: 84, scope: !12)
!24 = distinct !DISubprogram(name: "svp_simple_616_001_isr_1", scope: !8, file: !8, line: 8, type: !9, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!25 = !{!26, !26, i64 0}
!26 = !{!"any pointer", !15, i64 0}
!27 = !DILocation(line: 10, column: 3, scope: !24)
!28 = !DILocation(line: 10, column: 14, scope: !24)
!29 = !DILocation(line: 10, column: 17, scope: !24)
!30 = !DILocation(line: 10, column: 7, scope: !24)
!31 = !DILocation(line: 11, column: 8, scope: !24)
!32 = !DILocation(line: 11, column: 6, scope: !24)
!33 = !DILocation(line: 14, column: 3, scope: !24)
!34 = !DILocation(line: 14, column: 14, scope: !24)
!35 = !DILocation(line: 14, column: 17, scope: !24)
!36 = !DILocation(line: 14, column: 7, scope: !24)
!37 = !DILocation(line: 15, column: 8, scope: !24)
!38 = !DILocation(line: 15, column: 6, scope: !24)
!39 = !DILocation(line: 17, column: 1, scope: !24)
!40 = distinct !DISubprogram(name: "svp_simple_616_001_isr_2", scope: !8, file: !8, line: 19, type: !9, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 21, column: 3, scope: !40)
!42 = !DILocation(line: 21, column: 14, scope: !40)
!43 = !DILocation(line: 21, column: 17, scope: !40)
!44 = !DILocation(line: 21, column: 7, scope: !40)
!45 = !DILocation(line: 22, column: 8, scope: !40)
!46 = !DILocation(line: 22, column: 6, scope: !40)
!47 = !DILocation(line: 25, column: 3, scope: !40)
!48 = !DILocation(line: 25, column: 14, scope: !40)
!49 = !DILocation(line: 25, column: 17, scope: !40)
!50 = !DILocation(line: 25, column: 7, scope: !40)
!51 = !DILocation(line: 26, column: 8, scope: !40)
!52 = !DILocation(line: 26, column: 6, scope: !40)
!53 = !DILocation(line: 28, column: 1, scope: !40)
!54 = distinct !DISubprogram(name: "svp_simple_616_001_main", scope: !8, file: !8, line: 30, type: !9, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 31, column: 21, scope: !54)
!56 = !DILocation(line: 31, column: 24, scope: !54)
!57 = !DILocation(line: 31, column: 3, scope: !54)
!58 = !DILocation(line: 33, column: 21, scope: !54)
!59 = !DILocation(line: 33, column: 24, scope: !54)
!60 = !DILocation(line: 33, column: 3, scope: !54)
!61 = !DILocation(line: 35, column: 21, scope: !54)
!62 = !DILocation(line: 35, column: 24, scope: !54)
!63 = !DILocation(line: 35, column: 3, scope: !54)
!64 = !DILocation(line: 37, column: 21, scope: !54)
!65 = !DILocation(line: 37, column: 24, scope: !54)
!66 = !DILocation(line: 37, column: 3, scope: !54)
!67 = !DILocation(line: 39, column: 3, scope: !54)
