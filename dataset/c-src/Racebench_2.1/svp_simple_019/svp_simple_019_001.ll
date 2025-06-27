; ModuleID = 'svp_simple_019_001.bc'
source_filename = "./svp_simple_019_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_019_001_global_condition1 = global i32 1, align 4
@svp_simple_019_001_global_condiiton2 = global i32 1, align 4
@svp_simple_019_001_global_condition3 = global i32 1, align 4
@svp_simple_019_001_global_para1 = common global i32 0, align 4
@svp_simple_019_001_global_para2 = common global i32 0, align 4
@svp_simple_019_001_global_para3 = common global i32 0, align 4
@svp_simple_019_001_global_var2 = common global i32 0, align 4
@svp_simple_019_001_global_var1 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_019_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = bitcast i32* %1 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #3, !dbg !10
  %7 = bitcast i32* %2 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #3, !dbg !10
  %8 = bitcast i32* %3 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #3, !dbg !10
  %9 = bitcast i32* %4 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #3, !dbg !10
  %10 = bitcast i32* %5 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #3, !dbg !10
  call void (...) @init(), !dbg !11
  %11 = call i32 (...) @rand(), !dbg !12
  %12 = srem i32 %11, 10, !dbg !13
  store volatile i32 %12, i32* @svp_simple_019_001_global_para1, align 4, !dbg !14, !tbaa !15
  %13 = call i32 (...) @rand(), !dbg !19
  %14 = srem i32 %13, 10, !dbg !20
  store volatile i32 %14, i32* @svp_simple_019_001_global_para2, align 4, !dbg !21, !tbaa !15
  %15 = call i32 (...) @rand(), !dbg !22
  %16 = srem i32 %15, 10, !dbg !23
  store volatile i32 %16, i32* @svp_simple_019_001_global_para3, align 4, !dbg !24, !tbaa !15
  %17 = load volatile i32, i32* @svp_simple_019_001_global_para1, align 4, !dbg !25, !tbaa !15
  %18 = load volatile i32, i32* @svp_simple_019_001_global_para3, align 4, !dbg !26, !tbaa !15
  %19 = add nsw i32 %17, %18, !dbg !27
  %20 = load volatile i32, i32* @svp_simple_019_001_global_para2, align 4, !dbg !28, !tbaa !15
  %21 = icmp sgt i32 %19, %20, !dbg !29
  br i1 %21, label %22, label %24, !dbg !30

22:                                               ; preds = %0
  %23 = load volatile i32, i32* @svp_simple_019_001_global_var2, align 4, !dbg !31, !tbaa !15
  store i32 %23, i32* %1, align 4, !dbg !32, !tbaa !15
  br label %24, !dbg !33

24:                                               ; preds = %22, %0
  %25 = load volatile i32, i32* @svp_simple_019_001_global_var2, align 4, !dbg !34, !tbaa !15
  store i32 %25, i32* %2, align 4, !dbg !35, !tbaa !15
  %26 = load volatile i32, i32* @svp_simple_019_001_global_condition1, align 4, !dbg !36, !tbaa !15
  %27 = icmp eq i32 %26, 1, !dbg !37
  br i1 %27, label %28, label %33, !dbg !38

28:                                               ; preds = %24
  %29 = load volatile i32, i32* @svp_simple_019_001_global_condiiton2, align 4, !dbg !39, !tbaa !15
  %30 = icmp eq i32 %29, 1, !dbg !40
  br i1 %30, label %31, label %33, !dbg !41

31:                                               ; preds = %28
  %32 = load volatile i32, i32* @svp_simple_019_001_global_var1, align 4, !dbg !42, !tbaa !15
  store i32 %32, i32* %3, align 4, !dbg !43, !tbaa !15
  br label %33, !dbg !44

33:                                               ; preds = %31, %28, %24
  call void (...) @idlerun(), !dbg !45
  call void @disable_isr(i32 1), !dbg !46
  %34 = load volatile i32, i32* @svp_simple_019_001_global_condition1, align 4, !dbg !47, !tbaa !15
  %35 = icmp eq i32 %34, 1, !dbg !48
  br i1 %35, label %36, label %41, !dbg !49

36:                                               ; preds = %33
  %37 = load volatile i32, i32* @svp_simple_019_001_global_condition3, align 4, !dbg !50, !tbaa !15
  %38 = icmp eq i32 %37, 1, !dbg !51
  br i1 %38, label %39, label %41, !dbg !52

39:                                               ; preds = %36
  %40 = load volatile i32, i32* @svp_simple_019_001_global_var1, align 4, !dbg !53, !tbaa !15
  store i32 %40, i32* %4, align 4, !dbg !54, !tbaa !15
  br label %41, !dbg !55

41:                                               ; preds = %39, %36, %33
  call void @enable_isr(i32 1), !dbg !56
  call void (...) @idlerun(), !dbg !57
  call void @disable_isr(i32 1), !dbg !58
  %42 = load volatile i32, i32* @svp_simple_019_001_global_condiiton2, align 4, !dbg !59, !tbaa !15
  %43 = icmp eq i32 %42, 1, !dbg !60
  br i1 %43, label %44, label %49, !dbg !61

44:                                               ; preds = %41
  %45 = load volatile i32, i32* @svp_simple_019_001_global_condition3, align 4, !dbg !62, !tbaa !15
  %46 = icmp eq i32 %45, 0, !dbg !63
  br i1 %46, label %47, label %49, !dbg !64

47:                                               ; preds = %44
  %48 = load volatile i32, i32* @svp_simple_019_001_global_var1, align 4, !dbg !65, !tbaa !15
  store i32 %48, i32* %5, align 4, !dbg !66, !tbaa !15
  br label %49, !dbg !67

49:                                               ; preds = %47, %44, %41
  call void @enable_isr(i32 1), !dbg !68
  %50 = bitcast i32* %5 to i8*, !dbg !69
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %50) #3, !dbg !69
  %51 = bitcast i32* %4 to i8*, !dbg !69
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %51) #3, !dbg !69
  %52 = bitcast i32* %3 to i8*, !dbg !69
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %52) #3, !dbg !69
  %53 = bitcast i32* %2 to i8*, !dbg !69
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %53) #3, !dbg !69
  %54 = bitcast i32* %1 to i8*, !dbg !69
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %54) #3, !dbg !69
  ret void, !dbg !69
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare void @init(...) #2

declare i32 @rand(...) #2

declare void @idlerun(...) #2

declare void @disable_isr(i32) #2

declare void @enable_isr(i32) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_019_001_isr_1() #0 !dbg !70 {
  call void (...) @idlerun(), !dbg !71
  %1 = load volatile i32, i32* @svp_simple_019_001_global_para1, align 4, !dbg !72, !tbaa !15
  %2 = load volatile i32, i32* @svp_simple_019_001_global_para3, align 4, !dbg !73, !tbaa !15
  %3 = add nsw i32 %1, %2, !dbg !74
  %4 = load volatile i32, i32* @svp_simple_019_001_global_para2, align 4, !dbg !75, !tbaa !15
  %5 = icmp slt i32 %3, %4, !dbg !76
  br i1 %5, label %6, label %7, !dbg !77

6:                                                ; preds = %0
  store volatile i32 85, i32* @svp_simple_019_001_global_var2, align 4, !dbg !78, !tbaa !15
  br label %7, !dbg !79

7:                                                ; preds = %6, %0
  store volatile i32 0, i32* @svp_simple_019_001_global_condition3, align 4, !dbg !80, !tbaa !15
  store volatile i32 1, i32* @svp_simple_019_001_global_var1, align 4, !dbg !81, !tbaa !15
  ret void, !dbg !82
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_019_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_019")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_019_001_main", scope: !8, file: !8, line: 15, type: !9, scopeLine: 15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_019_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_019")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 16, column: 3, scope: !7)
!11 = !DILocation(line: 17, column: 3, scope: !7)
!12 = !DILocation(line: 18, column: 37, scope: !7)
!13 = !DILocation(line: 18, column: 44, scope: !7)
!14 = !DILocation(line: 18, column: 35, scope: !7)
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C/C++ TBAA"}
!19 = !DILocation(line: 19, column: 37, scope: !7)
!20 = !DILocation(line: 19, column: 44, scope: !7)
!21 = !DILocation(line: 19, column: 35, scope: !7)
!22 = !DILocation(line: 20, column: 37, scope: !7)
!23 = !DILocation(line: 20, column: 44, scope: !7)
!24 = !DILocation(line: 20, column: 35, scope: !7)
!25 = !DILocation(line: 23, column: 8, scope: !7)
!26 = !DILocation(line: 23, column: 42, scope: !7)
!27 = !DILocation(line: 23, column: 40, scope: !7)
!28 = !DILocation(line: 23, column: 77, scope: !7)
!29 = !DILocation(line: 23, column: 75, scope: !7)
!30 = !DILocation(line: 23, column: 7, scope: !7)
!31 = !DILocation(line: 24, column: 15, scope: !7)
!32 = !DILocation(line: 24, column: 13, scope: !7)
!33 = !DILocation(line: 24, column: 5, scope: !7)
!34 = !DILocation(line: 26, column: 13, scope: !7)
!35 = !DILocation(line: 26, column: 11, scope: !7)
!36 = !DILocation(line: 28, column: 8, scope: !7)
!37 = !DILocation(line: 28, column: 45, scope: !7)
!38 = !DILocation(line: 28, column: 51, scope: !7)
!39 = !DILocation(line: 28, column: 55, scope: !7)
!40 = !DILocation(line: 28, column: 92, scope: !7)
!41 = !DILocation(line: 28, column: 7, scope: !7)
!42 = !DILocation(line: 29, column: 15, scope: !7)
!43 = !DILocation(line: 29, column: 13, scope: !7)
!44 = !DILocation(line: 29, column: 5, scope: !7)
!45 = !DILocation(line: 30, column: 3, scope: !7)
!46 = !DILocation(line: 31, column: 3, scope: !7)
!47 = !DILocation(line: 32, column: 8, scope: !7)
!48 = !DILocation(line: 32, column: 45, scope: !7)
!49 = !DILocation(line: 32, column: 51, scope: !7)
!50 = !DILocation(line: 32, column: 55, scope: !7)
!51 = !DILocation(line: 32, column: 92, scope: !7)
!52 = !DILocation(line: 32, column: 7, scope: !7)
!53 = !DILocation(line: 33, column: 15, scope: !7)
!54 = !DILocation(line: 33, column: 13, scope: !7)
!55 = !DILocation(line: 33, column: 5, scope: !7)
!56 = !DILocation(line: 34, column: 3, scope: !7)
!57 = !DILocation(line: 35, column: 3, scope: !7)
!58 = !DILocation(line: 36, column: 3, scope: !7)
!59 = !DILocation(line: 37, column: 8, scope: !7)
!60 = !DILocation(line: 37, column: 45, scope: !7)
!61 = !DILocation(line: 37, column: 51, scope: !7)
!62 = !DILocation(line: 37, column: 55, scope: !7)
!63 = !DILocation(line: 37, column: 92, scope: !7)
!64 = !DILocation(line: 37, column: 7, scope: !7)
!65 = !DILocation(line: 38, column: 15, scope: !7)
!66 = !DILocation(line: 38, column: 13, scope: !7)
!67 = !DILocation(line: 38, column: 5, scope: !7)
!68 = !DILocation(line: 39, column: 3, scope: !7)
!69 = !DILocation(line: 40, column: 1, scope: !7)
!70 = distinct !DISubprogram(name: "svp_simple_019_001_isr_1", scope: !8, file: !8, line: 42, type: !9, scopeLine: 42, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 43, column: 3, scope: !70)
!72 = !DILocation(line: 44, column: 8, scope: !70)
!73 = !DILocation(line: 44, column: 42, scope: !70)
!74 = !DILocation(line: 44, column: 40, scope: !70)
!75 = !DILocation(line: 44, column: 77, scope: !70)
!76 = !DILocation(line: 44, column: 75, scope: !70)
!77 = !DILocation(line: 44, column: 7, scope: !70)
!78 = !DILocation(line: 45, column: 36, scope: !70)
!79 = !DILocation(line: 45, column: 5, scope: !70)
!80 = !DILocation(line: 47, column: 40, scope: !70)
!81 = !DILocation(line: 49, column: 34, scope: !70)
!82 = !DILocation(line: 50, column: 1, scope: !70)
